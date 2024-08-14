class CreatePostSocialShares < ActiveRecord::Migration[7.0]
  def change
    create_table :post_social_shares do |t|
      t.references :post, null: false, foreign_key: true
      t.string :provider

      t.timestamps
    end
  end
end
