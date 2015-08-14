class CreatePortfolioItems < ActiveRecord::Migration
  def change
    create_table :portfolio_items do |t|
      t.string :key
      t.string :title
      t.text :summary
      t.string :person_name
      t.string :email
      t.boolean :default, default: false
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
