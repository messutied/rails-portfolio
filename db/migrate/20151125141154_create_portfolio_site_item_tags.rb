class CreatePortfolioSiteItemTags < ActiveRecord::Migration
  def change
    create_table :portfolio_site_item_tags do |t|
      t.string :key
      t.string :name

      t.timestamps null: false
    end
  end
end
