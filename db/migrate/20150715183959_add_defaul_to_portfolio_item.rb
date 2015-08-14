class AddDefaulToPortfolioItem < ActiveRecord::Migration
  def change
    add_column :portfolio_items, :default, :boolean, default: false
  end
end
