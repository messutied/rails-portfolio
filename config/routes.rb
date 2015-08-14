Portfolio::Engine.routes.draw do
  devise_for :admin_users, class_name: 'Portfolio::AdminUser', module: :devise
    # path: '', path_names: {sign_in: '/portfolio/admin_users/sign_in'},
    # controllers: { registrations: 'portfolio/registrations' }
  
  scope '/admin' do
    resources :items do
      resources :social_links
    end

    root 'items#index'
  end

  root 'items#default', as: :default_item
end
