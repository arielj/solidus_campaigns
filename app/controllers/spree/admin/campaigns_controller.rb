class Spree::Admin::CampaignsController < Spree::Admin::ResourceController

  def add_product
    campaign = find_resource
    product = Spree::Product.find_by(slug: params[:product_slug])
    campaign.products << product unless campaign.products.include?(product)
    redirect_back fallback_location: edit_admin_campaign_path(campaign)
  end

  def remove_product
    campaign = find_resource
    product = Spree::Product.find_by(slug: params[:product_slug])
    campaign.products.destroy(product) if campaign.products.include?(product)
    redirect_back fallback_location: edit_admin_campaign_path(campaign)
  end

  def find_resource
    Spree::Campaign.friendly.find(params[:id])
  end

private
  def collection
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 20
    model_class.page(page).per(per_page)
  end
end
