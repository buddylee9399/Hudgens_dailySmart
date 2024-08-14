class AddFollowedIdToFollowings < ActiveRecord::Migration[7.0]
  def change
    add_column :followings, :followed_id, :integer
  end
end
