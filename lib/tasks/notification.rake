namespace :notification do
  namespace :worked do
    desc "前日の勤怠の通知"
    task yesterday: :environment do
      target = DateTime.yesterday
      notifier = Slack::Notifier.new Settings.slack.worked.webhook_url, username: "#{target.strftime("%Y-%m-%d")} Working Records"
      #notifier.ping "#{target.strftime("%m/%d")}の勤務状況"
      begin
        Store.all.each do |store|
          StampedDaily.where(staff: store.staffs, ymd: target.ymd).includes(:staff).each_with_index do |sd,i|
            notifier.ping "_#{store.name}_" if i == 0
            staff = sd.staff

            t = "【 *#{staff.code}* *#{staff.name}* 】  "
            t << "*出勤*: #{sd.work_start_at&.strftime("%m/%d %H:%M")}\t"
            t << "*退勤*: #{sd.work_end_at&.strftime("%m/%d %H:%M")}\t"
            t << "*実働*: #{sd.worked_hm}(#{sd.worked_hour})\n"
            t << "```"
            t << "所定: #{sd.fixed_hm}(#{sd.fixed_hour})  "
            t << "残業: #{sd.overtime_hm}(#{sd.overtime_hour})  "
            t << "深夜: #{sd.midnight_hm}(#{sd.midnight_hour})"
            t << "```"

            notifier.ping t
          end
        end
      rescue => e
        Rails.logger.fatal e
        notifier.ping "<!channel> :scream: notification:worked:yesterday でエラーが発生しました。"
      end
    end
  end
end
