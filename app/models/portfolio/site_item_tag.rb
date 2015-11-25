module Portfolio
  class SiteItemTag < ActiveRecord::Base
    validates :name, presence: true
    before_validation :set_key
    
    has_many :site_projects
    has_and_belongs_to_many :site_items
    
    private
    
    def set_key
      self.key = name.parameterize if key.blank?
    end
  end
end
