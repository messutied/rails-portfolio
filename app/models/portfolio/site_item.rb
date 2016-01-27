module Portfolio
  class SiteItem < ActiveRecord::Base
    belongs_to :site
    belongs_to :site_item_category
    has_many :site_item_images, dependent: :delete_all
    has_and_belongs_to_many :site_item_tags

    validates :title, :site, presence: true

    scope :uncategorized, -> { where site_item_category_id: nil }
    scope :categorized,   -> { where.not(site_item_category_id: nil) }
    scope :featured,      -> { where featured: true }
    scope :published,     -> { where public: true }
    scope :tagged_with,   ->(tag) {
      joins(:site_item_tags).where('portfolio_site_item_tags.id = ?', tag.id)
    }

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

    def self.group_by_categories
      SiteItemCategory.where(id: self.select(:site_item_category_id))
    end

    # overriding .subclasses because its an empty array at the time of
    # constructing the routes
    def self.subclasses
      [SiteProject]
    end

    def self.subclasses_names
      subclasses.map { |d| d.name.underscore.split('/').last }
    end

    def self.display_name
      nil
    end

    def self.resource_name
      self.name.underscore.split('/').last
    end

    def self.human_name
      self.resource_name.split('_').last
    end
  end
end
