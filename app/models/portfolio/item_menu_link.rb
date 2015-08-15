module Portfolio
  class ItemMenuLink < ActiveRecord::Base
    belongs_to :item
  end
end
