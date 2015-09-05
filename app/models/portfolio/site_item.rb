module Portfolio
  class SiteItem < ActiveRecord::Base
    belongs_to :site
    belongs_to :site_item_type
    has_many :site_item_images, dependent: :delete_all

    before_create :set_type

    def default_image_url style=:medium
      if site_item_images.empty?
        nil
      else
        img = site_item_images.default.first || site_item_images.first
        img.image.url(style)
      end
    end

    private

    def set_type
      self.site_item_type = SiteItemType.find_by(name: 'projects')
    end
  end
end
