# == Schema Information
#
# Table name: post_social_shares
#
#  id         :integer          not null, primary key
#  provider   :string
#  status     :integer          default("not_to_export")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#
# Indexes
#
#  index_post_social_shares_on_post_id  (post_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#
class PostSocialShare < ApplicationRecord
  enum status: { not_to_export: 0, export_post: 1 }
  belongs_to :post, inverse_of: :post_social_shares
  validates_presence_of :provider
end
