class AddTokenToSocialConnections < ActiveRecord::Migration[7.0]
  def change
    add_column :social_connections, :token, :text
  end
end
