Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'

    resources :items, only: [:index, :show]

    devise_for :customers, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }

    resource :customers, only: [:show, :update] do
      get 'information/edit', to: 'customers#edit', as: 'edit_information'
      get 'unsubscribe'
      patch 'withdrawal'
    end

    resources :cart_items, only: [:index, :create, :update, :destroy] do
      delete 'destroy_all', on: :collection
    end

    resources :orders, only: [:new, :create, :index, :show] do
      post 'confirm', on: :collection
      get 'complete', on: :collection
    end

    resources :deliveries, only: [:index, :new ,:edit, :create ,:update, :destroy]

  end

  namespace :admin do
    devise_for :admins, controllers: { sessions: 'admin/sessions' }, path: '', path_names: { sign_in: 'sign_in', sign_out: 'sign_out'}

    get '', to: 'homes#top'

    resources :items, except: [:destroy]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, except: [:new, :create, :destroy]

    resources :orders, only: [:show, :update]

    resources :order_details, only: [:update]
  end
end
