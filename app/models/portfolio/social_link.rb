module Portfolio
  class SocialLink < ActiveRecord::Base
    has_attached_file :image, :styles => { :medium => "32x32>", :large => "64x64>" }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    # LINKS = {
    #   github:   ['Github', 'http://github.com/'],
    #   twitter:  ['Twitter', 'http://twitter.com/'],
    #   linkedin: ['Linkedin', 'http://www.linkedin.com/in/'],
    # }

    # def self.list
    #   LINKS.to_a.map { |l| [ l[1][0], l[0] ] }
    # end

    # def get_info
    #   link = LINKS[name.to_sym]
    #   {title: link[0], url: link[1]+user_name, img: "portfolio/social_links/#{name}.png"}
    # end
  end
end
