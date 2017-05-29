class Inquiry
  include ActiveModel::Model

  attr_accessor :email, :name, :title, :body

  validates :email,:name,:body, presence: true

  def send!(current_account = nil)
    if current_account
      self.body << "\n\nYourCorpID: #{current_account.id}"
    end
    notifier = Slack::Notifier.new Settings.slack.webhook_url.inquiry, username: "pippi"
    inquery_payload = {
      title: "#{self.name}(#{self.email})さんからお問い合わせです",
      title_link: "mailto:#{self.email}",
      text: self.body.force_encoding('utf-8')
    }
    notifier.ping ":thought_balloon: お問い合わせを頂きました:exclamation:", attachments: [inquery_payload]
  end

end
