class Menu < ApplicationRecord
  has_many :stores_menus
  has_many :stores, through: :stores_menus

  scope :enables, ->{ where(enable: true) }

  def content_md
    return @content_md if @content_md
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
    @content_md = markdown.render(self.content || "")
  end
end
