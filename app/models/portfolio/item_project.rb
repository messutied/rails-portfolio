module Portfolio
  class ItemProject < ActiveRecord::Base
    belongs_to :item
    has_many :item_project_images, dependent: :delete_all

    def default_image_url style=:medium
      if item_project_images.empty?
        nil
      else
        image = item_project_images.default.first || item_project_images.first
        image.image.url(style)
      end
    end
  end
end
