namespace :payjp do
  desc "支払い情報の同期"
  task sync_payment: :environment do
    notifier = Slack::Notifier.new Settings.slack.batch.webhook_url
    notifier.ping "`Batch START >> payjp:sync_payment <<`"
    success, failer = 0, 0
    begin
      # デイリーなので、昨日までに有効期限切れのものを全件更新する
      s_t = Subscription.arel_table
      tgt_datetime = Date.yesterday.end_of_day
      Subscription.where(s_t[:period_end].lteq(tgt_datetime)).find_in_batches(batch_size: 5) do |g|
        g.each do |s|
          payjp_s = Payjp::Subscription.retrieve(s.sub_id)
          s.period_start = Time.at(payjp_s.current_period_start)
          s.period_end   = Time.at(payjp_s.current_period_end)
          s.status       = payjp_s.status == "active" ? 10 : 0
          log = s.subscription_logs.build
          log.response = payjp_s.to_json
          s.save ? success += 1 : failer += 1
        end
      end
    rescue => e
      Rails.logger.fatal e
      notifier.ping "<!channel> :scream: lib/tasks/sync_payjp_payment.rake でエラーが発生しました。"
    end
    notifier.ping "`Batch E N D >> payjp:sync_payment [s:#{success},f:#{failer}] <<`"
  end
end
