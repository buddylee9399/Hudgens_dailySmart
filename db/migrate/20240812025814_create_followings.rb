class CreateFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :followings do |t|
      t.integer :follower
      t.integer :following

      t.timestamps
    end
  end
end
