# This migration comes from portfolio (originally 20151124210602)
class AddSiteItemCategoryIdToSiteItem < ActiveRecord::Migration
  def change
    add_column :portfolio_site_items, :site_item_category_id, :integer, index: true
    add_foreign_key :portfolio_site_items, :portfolio_site_item_categories, column: :site_item_category_id
  end
end
