class CreateCampaignsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_campaigns_products do |t|
      t.references :campaign
      t.references :product
    end
  end
end
