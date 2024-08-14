class AddStatusToPostSocialShares < ActiveRecord::Migration[7.0]
  def change
    add_column :post_social_shares, :status, :integer, default: 0
  end
end
