class CreatePortfolioSiteItemTagsItems < ActiveRecord::Migration
  def change
    create_table :portfolio_site_item_tags_items, id: false do |t|
      t.references :site_item
      t.references :site_item_tag
    end
  end
end
