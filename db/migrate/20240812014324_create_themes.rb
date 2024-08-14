class CreateThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :themes do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
