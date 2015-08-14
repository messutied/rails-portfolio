module Portfolio
  module ItemsHelper
    def render_markdown text
      # TODO: move this construction to an initializer
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
      markdown.render text
    end
  end
end
