class Tip < ApplicationRecord

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language || 'javascript').div(:line_numbers => :table)
    end
  end

  def to_html
    render = HTMLwithCoderay.new(hard_wrap: true)

    options = {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      xhtml: true
    }
    markdown = Redcarpet::Markdown.new(render, options)
    markdown.render(self.contents).html_safe
  end
end
