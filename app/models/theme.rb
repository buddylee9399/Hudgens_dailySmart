# == Schema Information
#
# Table name: themes
#
#  id         :integer          not null, primary key
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  topic_id   :integer          not null
#
# Indexes
#
#  index_themes_on_post_id   (post_id)
#  index_themes_on_topic_id  (topic_id)
#
# Foreign Keys
#
#  post_id   (post_id => posts.id)
#  topic_id  (topic_id => topics.id)
#
class Theme < ApplicationRecord
  belongs_to :post
  belongs_to :topic, counter_cache: true

  accepts_nested_attributes_for :topic, reject_if: :all_blank
end
