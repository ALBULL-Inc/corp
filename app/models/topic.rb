class Topic < ApplicationRecord
  after_save :post_pubsubhubbub

  default_scope ->{ order(publish_at: :desc) }
  scope :enables, ->{ where(arel_table[:enable].eq(true).and( arel_table[:publish_at].lteq(DateTime.current)) ) }
  scope :carousels, ->{ enables.where(arel_table[:carousel].eq(true)) }

  private
    def post_pubsubhubbub
      return unless self.enable?
      include Rails.application.routes.url_helpers
      Nagareboshi::Sender.publish(topic_url(self))
    end
end
