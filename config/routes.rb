Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :campaigns do
      member do
        post :add_product
        patch :remove_product
        get :search_products
      end
    end
  end

  get "/campaign/:slug", to: 'campaigns#show', as: :show_campaign
end
