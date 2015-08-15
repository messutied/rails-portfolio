module Portfolio
  class ItemSocialLink < ActiveRecord::Base
    belongs_to :item
    belongs_to :social_link

    def url
      social_link.url_pattern.gsub(/(\[user_name\])/, user_name)
    end
  end
end
