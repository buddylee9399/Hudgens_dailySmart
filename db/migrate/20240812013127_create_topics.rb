class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :slug
      t.datetime :deleted_at
      t.integer :themes_count, default: 0

      t.timestamps
    end
  end
end
