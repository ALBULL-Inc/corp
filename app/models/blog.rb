class Blog < ApplicationRecord
  default_scope ->{ order(publish_at: :desc) }
  scope :enables, ->{ where(arel_table[:enable].eq(true).and( arel_table[:publish_at].lteq(DateTime.current)) ) }

  def body_md
    return @body_md if @body_md
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
    @body_md = markdown.render(self.body)
  end
end
