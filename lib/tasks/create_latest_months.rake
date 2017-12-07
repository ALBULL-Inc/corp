namespace :insert_months do
  task :to_latest => :environment do

    start_date = Date.new(2017,4,1)
    latest_day = Date.current.end_of_day
    already_yms = Month.pluck(:ym)

    d = start_date
    while d < latest_day
      ym = "#{d.year}#{"%02d" % d.month}"
      Month.create!(ym: ym) unless already_yms.include?(ym)
      d = d.next_month
    end

  end


  task :current_month => :environment do

    d = Date.current.end_of_day
    ym = "#{d.year}#{"%02d" % d.month}"
    Month.create!(ym: ym) unless Month.exists?(ym: ym)

  end

end
