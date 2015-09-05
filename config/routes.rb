Portfolio::Engine.routes.draw do
  if Portfolio.auth_method == :portfolio_admin_user
    devise_for :admin_users, class_name: 'Portfolio::AdminUser', module: :devise
  end
  
  scope '/admin' do
    resources :sites do
      resources :site_social_links
      resources :site_menu_links
      resources :site_items do
        resources :site_item_images do
          member { put :set_default }
        end
      end
    end
    resources :social_links

    root 'sites#index'
  end

  get '/:portfolio_key' => 'sites#show_by_key', as: :show_portfolio
  get '/:portfolio_key/projects/:id' => 'site_items#show', as: :show_portfolio_project
end
