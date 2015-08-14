class CreatePortfolioSocialLinks < ActiveRecord::Migration
  def change
    create_table :portfolio_social_links do |t|
      t.string :name
      t.string :user_name
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
