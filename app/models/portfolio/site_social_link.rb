module Portfolio
  class SiteSocialLink < ActiveRecord::Base
    belongs_to :site
    belongs_to :social_link

    def url
      social_link.url_pattern.gsub(/(\[user_name\])/, user_name)
    end
  end
end
