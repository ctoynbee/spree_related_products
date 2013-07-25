Spree::Core::Engine.routes.prepend do

  namespace :admin do

    resources :relation_types
    resources :products do
      get :related, :on => :member
      resources :relations
    end

  end

  namespace :api, :defaults => { :format => 'json' } do

    resources :products, :only => [] do
      get :related, :on => :member
    end

    resource :relations, :only => [] do
      delete :destroy_product_relations
      post :create
    end

	end

end
