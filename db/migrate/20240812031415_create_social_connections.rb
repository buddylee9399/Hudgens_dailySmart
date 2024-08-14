class CreateSocialConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :social_connections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :provider
      t.text :uid

      t.timestamps
    end
  end
end
