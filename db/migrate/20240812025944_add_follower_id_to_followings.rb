class AddFollowerIdToFollowings < ActiveRecord::Migration[7.0]
  def change
    add_column :followings, :follower_id, :integer
  end
end
