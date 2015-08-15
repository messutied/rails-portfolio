module Portfolio
  class SocialLink < ActiveRecord::Base
    has_attached_file :image, :styles => { :medium => "32x32>", :large => "64x64>" }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  end
end
