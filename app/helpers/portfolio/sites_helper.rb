module Portfolio
  module SitesHelper
    def render_markdown text
      # TODO: move this construction to an initializer
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
      markdown.render text.to_s
    end

    def unless_blank attribute, name
      attribute.blank? ? "<Empty #{name}>" : attribute
    end

    def items_to_show site
      Portfolio::SiteItem.subclasses.each do |klass|
        return true if klass.where(site: site).published.count > 0
      end
      
      return false
    end
  end
end
