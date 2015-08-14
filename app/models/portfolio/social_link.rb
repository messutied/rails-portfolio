class Portfolio::SocialLink < ActiveRecord::Base
  belongs_to :item
  self.table_name = 'portfolio_social_links'

  LINKS = {
    github:   ['Github', 'http://github.com/'],
    twitter:  ['Twitter', 'http://twitter.com/'],
    linkedin: ['Linkedin', 'http://www.linkedin.com/in/'],
  }

  def self.list
    LINKS.to_a.map { |l| [ l[1][0], l[0] ] }
  end

  def get_info
    link = LINKS[name.to_sym]
    {title: link[0], url: link[1]+user_name, img: "social_links/#{name}.png"}
  end
end
