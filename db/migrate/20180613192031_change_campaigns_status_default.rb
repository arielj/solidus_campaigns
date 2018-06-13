class ChangeCampaignsStatusDefault < ActiveRecord::Migration[5.1]
  def self.up
    change_column_default :spree_campaigns, :status, 1
  end

  def self.down
    change_column_default :spree_campaigns, :status, nil
  end
end
