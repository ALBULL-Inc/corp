# -*- encoding : utf-8 -*-
class Feedback < ActiveRecord::Base
  after_commit :slack_notification

  private
    def slack_notification
      notifier = Slack::Notifier.new Settings.slack.feedback.webhook_url
      notifier.ping ":thought_balloon: FBを頂きました:exclamation:\n```#{self.content.force_encoding('utf-8')}```"
    end
end
