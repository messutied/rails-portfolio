module Portfolio
  class SiteItem < ActiveRecord::Base
    belongs_to :site
    belongs_to :site_item_type
    has_many :site_item_images, dependent: :delete_all

    before_create :set_type

    SUBCLASSES = %w(site_project)

    scope :of_type, ->(type_name) {
      type = SiteItemType.find_by name: type_name.pluralize
      type ? where(site_item_type: type) : self.none
    }

    default_scope -> { self.of_type self.type_name unless self.type_name == 'item' }

    def default_image_url style=:medium
      if site_item_images.empty?
        nil
      else
        img = site_item_images.default.first || site_item_images.first
        img.image.url(style)
      end
    end

    # this is not always working for some reason
    def self.subclasses_names
      subclasses.map { |d| d.name.underscore.split('/').last }
    end

    private

    def self.type_name
      self.name.underscore.split('/').last.split('_').last
    end

    def self.type
      puts self.type_name.pluralize
      SiteItemType.find_by name: self.type_name.pluralize
    end

    def set_type
      type = self.class.type
      return if type.nil?
      self.site_item_type = type
    end
  end
end
