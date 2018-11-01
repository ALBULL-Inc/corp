require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Plan.exists?
  Plan.create(
    {
      id: 1,
      subscription: true,
      title: "月額3000円プラン",
      amount: 3000,
      currency: "jpy",
      interval: "month",
      start_at: Time.new(2018,10,1,0,0,0),
      end_at: Time.new(2099,12,31,23,59,59),
      position: 10,
      detail: "このプランでは、コーヒーが飲み放題です。1日何杯でも1ヶ月何杯でも飲み放題です！",
      image_src: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYF4jQMh8DwiH7roePesGGh3Nl3vhzPt8sEqAibkEj3useVUZWwA"
    }
  )
end

unless Store.exists?
  Store.create(
    {
      id: 1,
      enable: true,
      name: "Railly 赤坂店",
      postcode: "107-0052",
      city: "東京都港区赤坂2丁目",
      address: "14-8 赤坂SKビル3F-A",
      tel: "03-6807-4025",
      fax: "03-6807-4024",
      opening_time: "18:00",
      closing_time: "05:00",
      regular_holiday: "原則日曜日※月曜が祝日の場合は日曜営業の月曜休み",
      opened_on: "2018-01-04",
      closed_on: nil,
      position: 10,
      gmap_query: "pb=!1m18!1m12!1m3!1d3241.2026038076124!2d139.73609731525855!3d35.67201298019645!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x60188b86dd390f13%3A0x3b7e17727a060986!2sDarts+Bar+Railly!5e0!3m2!1sja!2sjp!4v1541042053189",
      spec: <<-SPEC
ダーツ: DARTSLIVE2 x 3
touchlive x 1
月替りスロット x 1
けん玉: ノーマル x 1　電玉(IoTけん玉) x 1
neu(ノイ)[カードゲーム] x 1

カウンター7席
2人掛けテーブル×4
2人掛け丸テーブルx1
着席合計 17名

スタンディング収容人数20名程度

壁掛け50インチモニター
音響設備あり(SPx2 MICx1)
SPEC
    }
  )
end

unless Menu.exists?
  CSV.foreach('db/seeds/menus.csv') do |row|
    Menu.create(enable: true, menu_category_id: row[0], name: row[1], amount: row[2])
  end
end
