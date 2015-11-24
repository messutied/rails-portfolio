Portfolio::Engine.routes.draw do
  if Portfolio.auth_method == :portfolio_admin_user
    devise_for :admin_users, class_name: 'Portfolio::AdminUser', module: :devise
  end
  
  namespace :admin do
    resources :site_item_categories
    resources :social_links
    resources :sites do
      resources :site_social_links
      resources :site_menu_links
      Portfolio::SiteItem::subclasses.each do |klass|
        resources klass.resource_name.pluralize do
          resources :site_item_images do
            member { put :set_default }
          end
        end
      end
    end

    root 'sites#index'
  end

  Portfolio::SiteItem.subclasses.each do |klass|
    resource_name = klass.type_name
    res = resource_name.pluralize
    dname = (klass.display_name || res).downcase
    get "/:portfolio_key/#{dname}/:id-:title" => "site_#{res}#show", as: "show_portfolio_#{resource_name}"
    get "/:portfolio_key/#{dname}" => "site_#{res}#index", as: "portfolio_#{res}"
  end

  get '/:portfolio_key' => 'sites#show_by_key', as: :show_portfolio
end
