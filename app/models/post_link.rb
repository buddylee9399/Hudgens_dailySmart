# == Schema Information
#
# Table name: post_links
#
#  id         :integer          not null, primary key
#  link_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#
# Indexes
#
#  index_post_links_on_post_id  (post_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#
class PostLink < ApplicationRecord
  belongs_to :post
  validates_presence_of :link_url
  validates :link_url, url: true
end
