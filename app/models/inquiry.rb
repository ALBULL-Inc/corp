class Inquiry
  include ActiveModel::Model

  attr_accessor :email, :name, :title, :body, :concern

  validates :name,:email,:body, presence: true

  def send!(current_account = nil)
    if current_account
      self.body << "\n\nRaillyID: #{current_account.id}"
    end
    notifier = Slack::Notifier.new Settings.slack.inquiry.webhook_url
    inquery_payload = {
      title: "#{self.name}(#{self.email})さんから#{self.concern_str}のお問い合わせです",
      title_link: "mailto:#{self.email}",
      text: self.body.force_encoding('utf-8')
    }
    notifier.ping ":thought_balloon: お問い合わせを頂きました:exclamation:", attachments: [inquery_payload]
  end

  def concern_str
    Inquiry.concerns[self.concern]
  end

  def self.concerns
    h = []
    defaults = [["1", "採用について"], ["2", "取材について"], ["3", "月額プランについて"], ["4", "パーティーについて"]]
    places = Store.enables.pluck(:id,:name).map{|id,name| ["p#{id}", "#{name}について"]}
    h += defaults
    h += places
    h << ["99", "その他"]
    h.to_h
  end

end
