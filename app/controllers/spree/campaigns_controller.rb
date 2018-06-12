class Spree::CampaignsController < Spree::StoreController
  def show
    @campaign = Spree::Campaign.find_by_slug!(params[:slug])
  end

  def should_generate_new_friendly_id?
    name_changed? || slug.blank? || super
  end
end
