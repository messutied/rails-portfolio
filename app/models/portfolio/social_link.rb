module Portfolio
  class SocialLink < ActiveRecord::Base
    has_attached_file :image, :styles => { :medium => "32x32>", :large => "64x64>" }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    has_many :item_social_links, dependent: :delete_all

    DEFAULT_LINKS = [
      ['Github', 'http://github.com/[user_name]', 'github'],
      ['Twitter', 'http://twitter.com/[user_name]', 'twitter'],
      ['Linkedin', 'http://www.linkedin.com/in/[user_name]', 'linkedin'],
    ]
  end
end
