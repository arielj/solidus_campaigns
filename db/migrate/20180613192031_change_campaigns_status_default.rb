class ChangeCampaignsStatusDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :spree_campaigns, :status, 0
  end
end
