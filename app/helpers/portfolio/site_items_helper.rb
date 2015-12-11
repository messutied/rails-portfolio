module Portfolio
  module SiteItemsHelper
    def site_item_image site_item, style
      if site_item.default_image
        image_tag(site_item.default_image.image(style))
      else
        image_tag("portfolio/#{style}/missing.png")
      end
    end
    
    def ajax_checkbox item, field
      check_box_tag field, item.id, item[field],
        class: 'ajax_checkbox',
        data: { path: polymorphic_path([:admin, @site, item]), field: field }
    end
  end
end
