module Portfolio
  class Site < ActiveRecord::Base
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }
    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    validates :person_name, presence: true

    has_many :site_social_links, dependent: :delete_all
    has_many :site_menu_links, dependent: :delete_all
    has_many :site_projects
    has_many :site_items, dependent: :delete_all
    after_update :set_only_one_default
    before_validation :set_key

    private

    def set_only_one_default
      if self.default_changed? and self.default
        Portfolio::Site.where.not(id: id).update_all(default: false)
      end
    end

    def set_key
      self.key = person_name.parameterize('_') if key.blank?
    end
  end
end
