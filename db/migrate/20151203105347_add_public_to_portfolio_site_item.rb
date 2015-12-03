class AddPublicToPortfolioSiteItem < ActiveRecord::Migration
  def change
    add_column :portfolio_site_items, :public, :boolean, default: false
  end
end
