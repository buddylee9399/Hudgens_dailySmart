class CreatePostLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :post_links do |t|
      t.string :link_url
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
