class Menu < ApplicationRecord
  belongs_to :store

  scope :enables, ->{ where(enable: true) }

  def price
    @price ||= "#{self.amount.to_s(:delimited)}円"
  end

  def content_md
    return @content_md if @content_md
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
    @content_md = markdown.render(self.content || "")
  end
end
