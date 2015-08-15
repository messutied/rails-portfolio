class CreatePortfolioSocialLinks < ActiveRecord::Migration
  def change
    create_table :portfolio_social_links do |t|
      t.string :name
      t.string :url_pattern
      t.attachment :image

      t.timestamps null: false
    end

    LINKS = [
      ['Github', 'http://github.com/[user_name]', 'github'],
      ['Twitter', 'http://twitter.com/[user_name]', 'twitter'],
      ['Linkedin', 'http://www.linkedin.com/in/[user_name]', 'linkedin'],
    ]

    LINKS.each do |link|
      Portfolio::SocialLink.create name: link[0], url_pattern: link[1], 
        image: File.open("#{Portfolio::Engine.root}/app/assets/images/portfolio/social_links/#{link[2]}.png")
    end
  end
end
