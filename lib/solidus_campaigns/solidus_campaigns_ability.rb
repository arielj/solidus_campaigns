class SolidusCampaignsAbility
  include CanCan::Ability

  def initialize(user)
    can :read, Spree::Campaign
    can :index, Spree::Campaign
  end
end
