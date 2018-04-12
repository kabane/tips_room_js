class Tip < ApplicationRecord
  def to_html
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)

    markdown.render(self.contents).html_safe
  end
end
