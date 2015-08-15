module Portfolio
  class ItemProject < ActiveRecord::Base
    belongs_to :item
    has_many :item_project_images, dependent: :delete_all
  end
end
