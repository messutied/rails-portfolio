class CreatePfPortfolios < ActiveRecord::Migration
  def change
    create_table :portfolio_items do |t|
      t.string :key
      t.string :title
      t.text :summary

      t.timestamps null: false
    end
  end
end
