class AddSummaryToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_campaigns, :summary, :text
  end
end
