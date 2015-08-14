class AddPersonNameToPortfolioItem < ActiveRecord::Migration
  def change
    add_column :portfolio_items, :person_name, :string
    add_column :portfolio_items, :email, :string
  end
end
