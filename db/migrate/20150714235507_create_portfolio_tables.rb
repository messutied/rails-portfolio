class CreatePortfolioTables < ActiveRecord::Migration
  def change
    create_table :portfolio_sites do |t|
      t.string :key, null: false, index: true
      t.string :person_name, null: false
      t.string :job_title, null: false
      t.string :greetings
      t.text :summary
      t.string :email
      t.boolean :default, default: false
      t.attachment :avatar

      t.timestamps null: false
    end

    create_table :portfolio_social_links do |t|
      t.string :name
      t.string :url_pattern
      t.attachment :image

      t.timestamps null: false
    end

    create_table :portfolio_site_social_links do |t|
      t.references :site, index: true
      t.references :social_link, index: true
      t.string :user_name

      t.timestamps null: false
    end
    add_foreign_key :portfolio_site_social_links, :portfolio_sites, column: :site_id
    add_foreign_key :portfolio_site_social_links, :portfolio_social_links, column: :social_link_id

    create_table :portfolio_site_menu_links do |t|
      t.references :site, index: true
      t.string :name
      t.string :url

      t.timestamps null: false
    end
    add_foreign_key :portfolio_site_menu_links, :portfolio_sites, column: :site_id

    create_table :portfolio_site_items do |t|
      t.references :site, null: false, index: true
      t.string :title
      t.text :body
      t.string :url

      t.timestamps null: false
    end
    add_foreign_key :portfolio_site_items, :portfolio_sites, column: :site_id

    create_table :portfolio_site_item_images do |t|
      t.references :site_item, index: true
      t.attachment :image
      t.boolean :default, default: false

      t.timestamps null: false
    end
    add_foreign_key :portfolio_site_item_images, :portfolio_site_items, column: :site_item_id

    # TODO: seems like this records below are not been created

    # creating default social links
    Portfolio::SocialLink::DEFAULT_LINKS.each do |link|
      Portfolio::SocialLink.create name: link[0], url_pattern: link[1],
        image: File.open("#{Portfolio::Engine.root}/app/assets/images/portfolio/social_links/#{link[2]}.png")
    end
  end
end
