module Portfolio
  class SiteItemCategory < ActiveRecord::Base
    validates :name, presence: true
    before_validation :set_key
    
    private
    
    def set_key
      self.key = name.parameterize if key.blank?
    end
  end
end
