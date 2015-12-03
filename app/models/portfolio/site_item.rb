module Portfolio
  class SiteItem < ActiveRecord::Base
    belongs_to :site
    belongs_to :site_item_type
    belongs_to :site_item_category
    has_many :site_item_images, dependent: :delete_all
    has_and_belongs_to_many :site_item_tags

    before_create :set_type

    scope :of_type, ->(type_name) {
      type = SiteItemType.find_by name: type_name.pluralize
      type ? where(site_item_type: type) : self.none
    }
    scope :uncategorized, -> { where site_item_category_id: nil }
    scope :featured, -> { where featured: true }
    scope :published, -> { where public: true }
    scope :tagged_with, ->(tag) { 
      joins(:site_item_tags).where('portfolio_site_item_tags.id = ?', tag.id) }
    
    def self.group_by_categories
      SiteItemCategory.where(id: self.select(:site_item_category_id))
    end

    def self.subclasses
      [SiteProject]
    end

    def self.display_name
      nil
    end

    # this is not always working for some reason
    def self.subclasses_names
      subclasses.map { |d| d.name.underscore.split('/').last }
    end

    def default_image
      if site_item_images.empty?
        nil
      else
        site_item_images.default.first || site_item_images.first
      end
    end

    def default_image_url style=:medium
      default_image.image.url(style)
    end

    private

    def self.resource_name
      self.name.underscore.split('/').last
    end

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
