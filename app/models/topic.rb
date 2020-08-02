class Topic < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :topicable, polymorphic: true

  after_save :post_pubsubhubbub

  default_scope ->{ order(publish_at: :desc) }
  scope :enables, ->{ where(arel_table[:enable].eq(true).and( arel_table[:publish_at].lteq(DateTime.current)) ) }

  private
    def post_pubsubhubbub
      return unless self.enable?
      Nagareboshi::Sender.publish(topic_url(self))
    end
end
