module Portfolio
  module SiteItemsHelper
    def site_item_image site_item, style
      if site_item.default_image
        image_tag(site_item.default_image.image(style))
      else
        image_tag("portfolio/#{style}/missing.png")
      end
    end
  end
end
