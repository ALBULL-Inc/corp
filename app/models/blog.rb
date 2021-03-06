class Blog < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :organization

  after_save :post_pubsubhubbub

  default_scope ->{ order(publish_at: :desc) }
  scope :enables, ->{ where(arel_table[:enable].eq(true).and( arel_table[:publish_at].lteq(DateTime.current)) ) }

  def body_md
    return @body_md if @body_md
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, hard_wrap: true, autolink: true, tables: true)
    @body_md = markdown.render(self.body)
  end

  private
    def post_pubsubhubbub
      return unless self.enable?
      Nagareboshi::Sender.publish(blog_url(self))
    end
end
