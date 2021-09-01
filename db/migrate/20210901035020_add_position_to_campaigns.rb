class AddPositionToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_campaigns, :position, :integer
  end
end
