class Entry < ApplicationRecord
  belongs_to :account
  belongs_to :recruit

  after_create :to_slack, if: ->{ Rails.env.production? }

  def to_slack
    notifier = Slack::Notifier.new Settings.slack.webhook_url.entry, username: "pippi"
    entry_payload = {
      title: "#{self.account.fullname}さんが#{self.recruit.title}にエントリーしました",
      title_link: Rails.application.routes.url_helpers.cms_account_url(self.account),
      text: self.comment.force_encoding('utf-8')
    }
    notifier.ping ":thought_balloon: エントリーを頂きました:exclamation:", attachments: [entry_payload]
  end
end
