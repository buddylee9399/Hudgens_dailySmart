class AddTwitterTokenSecretToSocialConnections < ActiveRecord::Migration[7.0]
  def change
    add_column :social_connections, :twitter_token_secret, :text
  end
end
