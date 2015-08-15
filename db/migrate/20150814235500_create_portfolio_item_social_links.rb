class CreatePortfolioItemSocialLinks < ActiveRecord::Migration
  def change
    create_table :portfolio_item_social_links do |t|
      t.references :item, index: true, foreign_key: true
      t.references :social_link, index: true, foreign_key: true
      t.string :user_name

      t.timestamps null: false
    end
  end
end
