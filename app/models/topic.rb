# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  deleted_at   :datetime
#  slug         :string
#  themes_count :integer          default(0)
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Topic < ApplicationRecord
  has_many :themes, inverse_of: :topic
  has_many :posts, through: :themes

  has_many :topic_followings
  has_many :users, through: :topic_followings

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title
  validates_uniqueness_of :title

  def self.top_ten
    select('topics.*, COUNT(posts.id) AS posts_count').
      joins(:posts).
      group('topics.id').
      order('posts_count DESC').
      limit(10)
  end

  def self.order_by_post_count
    select('topics.*, COUNT(posts.id) AS posts_count')
      .joins(:posts)
      .group('topics.id')
      .order('posts_count DESC')
  end  
end
