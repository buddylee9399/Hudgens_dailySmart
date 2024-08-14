# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  full_name              :string
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_type        :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  posts_count            :integer          default(0)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("standard_user")
#  roles                  :string
#  sign_in_count          :integer          default(0), not null
#  slug                   :string
#  unconfirmed_email      :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invited_by_id          :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_invitation_token      (invitation_token) UNIQUE
#  index_users_on_invited_by            (invited_by_type,invited_by_id)
#  index_users_on_invited_by_id         (invited_by_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
class User < ApplicationRecord
  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # after_create :assign_default_role
    # def assign_default_role
    #   if User.count == 1
    #     self.add_role(:site_admin) if self.roles.blank?
    #     self.add_role(:admin)
    #     self.add_role(:customer)      
    #   else
    #     self.add_role(:customer) if self.roles.blank?
    #   end
    # end  
  enum role: { standard_user: 0, site_admin: 1 }   
  extend FriendlyId
  friendly_id :username, use: :slugged
  has_many :posts, dependent: :destroy
  # has_many :votes, dependent: :destroy
  has_many :social_connections, dependent: :destroy
  # accepts_nested_attributes_for :user_images,
  #                               allow_destroy: true,
  #                               reject_if: proc { |attrs| attrs[:img].blank? }
  has_many :users_are_following_this_user, class_name:  "Following",
                                          foreign_key: "followed_id",
                                          dependent:   :destroy

  has_many :followers, through: :users_are_following_this_user,
                       source: :follower

  has_many :this_user_is_following_other_users, class_name:  "Following",
                                                foreign_key: "follower_id",
                                                dependent:   :destroy

  has_many :following, through: :this_user_is_following_other_users,
                       source: :followed

  has_many :topic_followings
  has_many :topics, through: :topic_followings

  validates_uniqueness_of :username, :slug
  validates_presence_of :full_name, :username, :slug

  after_create :auto_follow_account

  def self.order_by_post_count
    order('posts_count DESC')
  end

  def self.order_by_most_recent_post
    select('users.*,MAX(posts.created_at) as most_recent_post')
      .joins(:posts).order('most_recent_post desc').group('users.id')
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private def auto_follow_account
    Following.create(
      follower_id: self.id,
      followed_id: self.id
    )
  end     
end
