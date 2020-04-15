class AddMobileImageToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_attachment :spree_campaigns, :mobile_image
  end
end
