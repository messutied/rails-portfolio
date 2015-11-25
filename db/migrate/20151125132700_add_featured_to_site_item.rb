class AddFeaturedToSiteItem < ActiveRecord::Migration
  def change
    add_column :portfolio_site_items, :featured, :boolean, default: false
  end
end
