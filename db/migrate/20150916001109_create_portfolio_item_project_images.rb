class CreatePortfolioItemProjectImages < ActiveRecord::Migration
  def change
    create_table :portfolio_item_project_images do |t|
      t.references :item_project, index: true, foreign_key: true
      t.attachment :image
      t.boolean :default, default: false

      t.timestamps null: false
    end
  end
end
