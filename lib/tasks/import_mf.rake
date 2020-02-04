require 'csv'
namespace :mf do
  desc "勤怠移行用csv取り込み"
  task import: :environment do
    path = ENV['FILE_PATH']
    dry_run = (ENV['DRY_RUN'] || "true") == "true"
    store = Store.find(ENV['STORE_ID'])
    staff_ids = {}
    eaches = []
    CSV.foreach(path, headers: 1) do |row|
      no = row[0]
      day = row[4]
      time = row[5]
      dt = DateTime.parse("#{day} #{time} +0900")
      type = row[6] == "出勤" ? StampedType::WORKING_START : StampedType::WORKING_END

      staff_ids[no] ||= Staff.find_by(code: no).id rescue next


      #if dt.ymd >= 20200101
      if dt.ymd >= 20191201
        eaches << StampedEach.new(store_id: store.id, staff_id: staff_ids[no], stamped_type_id: type, stamped_at: dt, ymd: store.ymd(dt))
      end
    end
    p eaches.size

    begin
      eaches.each do |e|
        daily = StampedDaily.where(ymd: e.ymd, staff_id: e.staff_id).first_or_create
        daily.stamped_eaches << e unless dry_run
        p e
      end
      # StampedDailyをsave
    rescue => e
      Rails.logger.fatal e
      notifier.ping "<!channel> :scream: lib/tasks/import_mf.rake でエラーが発生しました。"
    end
  end
end
