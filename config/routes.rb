Spree::Core::Engine.routes.prepend do

  namespace :admin do

    resources :relation_types
    resources :products do
      get :related, :on => :member
      resources :relations
    end

  end

  namespace :api do

    resources :products, :only => [] do
      get :related, :on => :member
    end

    resources :relations, :only => [:create, :show] do
      collection do
        delete :destroy_product_relations
      end
    end

	end

end
