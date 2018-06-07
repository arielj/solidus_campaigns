Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :campaigns do
      member do
        patch :add_product
        patch :remove_product
      end
    end
  end
  # constraints(Spree::StaticPage) do
  #   get '/(*path)', :to => 'static_content#show', :as => 'static'
  # end
end
