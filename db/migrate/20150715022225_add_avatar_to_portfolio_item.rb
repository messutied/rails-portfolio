class AddAvatarToPortfolioItem < ActiveRecord::Migration
  def up
    add_attachment :portfolio_items, :avatar
  end

  def down
    remove_attachment :portfolio_items, :avatar
  end
end
