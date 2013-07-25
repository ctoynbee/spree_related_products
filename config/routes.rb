Spree::Core::Engine.routes.prepend do

  namespace :admin do

    resources :relation_types
    resources :products do
      get :related, :on => :member
      resources :relations
    end

  end

  namespace :api, :defaults => { :format => 'json' } do

    resources :products do
      get :related, :on => :member
    end

	end

end
