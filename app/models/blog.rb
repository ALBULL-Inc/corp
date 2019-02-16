class Blog < ApplicationRecord
  after_save :post_pubsubhubbub

  default_scope ->{ order(publish_at: :desc) }
  scope :enables, ->{ where(arel_table[:enable].eq(true).and( arel_table[:publish_at].lteq(DateTime.current)) ) }

  def body_md
    return @body_md if @body_md
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
    @body_md = markdown.render(self.body)
  end

  private
    def post_pubsubhubbub
      return unless self.enable?
      include Rails.application.routes.url_helpers
      Nagareboshi::Sender.publish(blog_url(self))
    end
end
