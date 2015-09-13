Portfolio::Engine.routes.draw do
  if Portfolio.auth_method == :portfolio_admin_user
    devise_for :admin_users, class_name: 'Portfolio::AdminUser', module: :devise
  end
  
  namespace :admin do
    resources :social_links
    resources :sites do
      resources :site_social_links
      resources :site_menu_links
      Portfolio::SiteItem::SUBCLASSES.each do |resource_name|
        resources resource_name.pluralize do
          resources :site_item_images do
            member { put :set_default }
          end
        end
      end
    end

    root 'sites#index'
  end

  Portfolio::SiteItem::SUBCLASSES.each do |resource_name|
    resource_name = resource_name.split('_').last
    res = resource_name.pluralize
    get "/:portfolio_key/#{res}/:id-:title" => "site_#{res}#show", as: "show_portfolio_#{resource_name}"
  end

  get '/:portfolio_key' => 'sites#show_by_key', as: :show_portfolio
end
