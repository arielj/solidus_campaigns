class ChangeCampaignsDateNullValue < ActiveRecord::Migration[5.1]
  def self.up
    change_column_null :spree_campaigns, :start_at, true
    change_column_null :spree_campaigns, :end_at, true
  end

  def self.down
    change_column_null :spree_campaigns, :start_at, false, Date.today
    change_column_null :spree_campaigns, :end_at, false, 1.year.from_now
  end
end
