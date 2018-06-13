class AddImageAttachmentToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_attachment :spree_campaigns, :image
  end
end
