# This migration comes from portfolio (originally 20151125151535)
class CreatePortfolioSiteItemTagsItems < ActiveRecord::Migration
  def change
    create_table :portfolio_site_item_tags_items, id: false do |t|
      t.references :site_item, index: true
      t.references :site_item_tag, index: true
    end
    
    add_foreign_key :portfolio_site_item_tags_items, :portfolio_site_items, column: :site_item_id
    add_foreign_key :portfolio_site_item_tags_items, :portfolio_site_item_tags, column: :site_item_tag_id
  end
end
