class Tip < ApplicationRecord
  belongs_to :user
  has_many :tags, :through => :tip_tags

  scope :published_only, -> { where(status: :published) }

  enum status: {draft: 0, published: 1}

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
      tables: true,
      hard_wrap: true,
      lax_html_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(render, options)
    markdown.render(self.contents).html_safe
  end

  def owner?(current_user)
    self.user == current_user
  end
end
