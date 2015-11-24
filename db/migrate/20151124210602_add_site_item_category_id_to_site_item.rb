class AddSiteItemCategoryIdToSiteItem < ActiveRecord::Migration
  def change
    add_column :portfolio_site_items, :site_item_category_id, :integer
  end
end
