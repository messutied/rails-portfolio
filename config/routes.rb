Portfolio::Engine.routes.draw do
  if Portfolio.auth_method == :portfolio_admin_user
    devise_for :admin_users, class_name: 'Portfolio::AdminUser', module: :devise
  end

  namespace :admin do
    post 'markdown_preview' => 'api#markdown_preview'

    resources :site_item_categories
    resources :site_item_tags
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
    resource_name = klass.human_name
    resource_plural_name = resource_name.pluralize
    resource_display_name = (klass.display_name || resource_plural_name).downcase

    get "/:portfolio_key/#{resource_display_name}/:id-:title" =>
        "site_#{resource_plural_name}#show",
        as: "show_portfolio_#{resource_name}"

    get "/:portfolio_key/#{resource_display_name}" =>
        "site_#{resource_plural_name}#index",
        as: "portfolio_#{resource_plural_name}"

    get "/:portfolio_key/#{resource_display_name}/tagged/:tag_key" =>
        "site_#{resource_plural_name}#index",
        as: "portfolio_#{resource_plural_name}_tagged"
  end

  get '/:portfolio_key' => 'sites#show_by_key', as: :show_portfolio
end
