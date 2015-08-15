class CreatePortfolioItemMenuLinks < ActiveRecord::Migration
  def change
    create_table :portfolio_item_menu_links do |t|
      t.references :item, index: true, foreign_key: true
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
