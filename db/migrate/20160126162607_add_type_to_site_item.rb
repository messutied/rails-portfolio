class AddTypeToSiteItem < ActiveRecord::Migration
  def change
    add_column :portfolio_site_items, :type, :string
  end
end
