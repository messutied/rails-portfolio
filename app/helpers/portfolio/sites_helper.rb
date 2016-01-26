module Portfolio
  module SitesHelper
    def render_markdown text
      # TODO: move this construction to an initializer
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
      markdown.render text
    end

    def unless_blank attribute, name
      attribute.blank? ? "<Empty #{name}>" : attribute
    end

    def item_path item
      send "show_portfolio_#{item.class.human_name}_path", 
           item.site.key, item.id, item.title.parameterize('_')
    end
  end
end
