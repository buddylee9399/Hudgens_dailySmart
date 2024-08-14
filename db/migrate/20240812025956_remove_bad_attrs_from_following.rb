class RemoveBadAttrsFromFollowing < ActiveRecord::Migration[7.0]
  def change
    remove_column :followings, :follower, :integer
    remove_column :followings, :following, :integer    
  end
end
