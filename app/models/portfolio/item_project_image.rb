module Portfolio
  class ItemProjectImage < ActiveRecord::Base
    has_attached_file :image,
      styles: { 
        large: '700x700>', 
        medium: '300x300#', 
        thumb: '150x150#'  
      }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    validates :image, presence: true

    belongs_to :item_project
    after_save :set_only_one_default

    scope :default, -> { where(default: true) }

    private

    def set_only_one_default
      if self.default
        item_project.item_project_images.where.not(id: id).update_all(default: false)
      end
    end
  end
end
