require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Plan.find_or_initialize_by(id: 1)
p1.update_attributes(
  {
    subscription: true,
    title: "ブロンズプラン",
    amount: 3000,
    currency: "jpy",
    interval: "month",
    start_at: Time.new(2018,10,1,0,0,0),
    end_at: Time.new(2099,12,31,23,59,59),
    position: 10,
    detail: "このプランでは、来店時のワンドリンクを半額で提供させていただきます！",
    image_src: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYF4jQMh8DwiH7roePesGGh3Nl3vhzPt8sEqAibkEj3useVUZWwA"
  }
)
p2 = Plan.find_or_initialize_by(id: 2)
p2.update_attributes(
  {
    subscription: true,
    title: "シルバープラン",
    amount: 5000,
    currency: "jpy",
    interval: "month",
    start_at: Time.new(2018,10,1,0,0,0),
    end_at: Time.new(2099,12,31,23,59,59),
    position: 20,
    detail: "このプランでは、ライトプランに加えて、投げ放題の料金も半額に！500円/時が250円/時になります。さらに、パーティー利用時の金額をお一人様200円割引させていただきます！",
    image_src: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYF4jQMh8DwiH7roePesGGh3Nl3vhzPt8sEqAibkEj3useVUZWwA"
  }
)
p3 = Plan.find_or_initialize_by(id: 3)
p3.update_attributes(
  {
    subscription: true,
    title: "ゴールドプラン",
    amount: 10000,
    currency: "jpy",
    interval: "month",
    start_at: Time.new(2018,10,1,0,0,0),
    end_at: Time.new(2099,12,31,23,59,59),
    position: 30,
    detail: "このプランでは、来店時のワンドリンクを無料にてご提供させていただきます！さらに、投げ放題の料金もいただきません！さらに、パーティー利用の金額をお一人様500円割引させていただきます！",
    image_src: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYF4jQMh8DwiH7roePesGGh3Nl3vhzPt8sEqAibkEj3useVUZWwA"
  }
)

s1 = Store.find_or_initialize_by(id: 1)
s1.update_attributes(
  {
    enable: true,
    comming_soon: false,
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
s2 = Store.find_or_initialize_by(id: 2)
s2.update_attributes(
  {
    enable: true,
    comming_soon: true,
    name: "Railly 2号店",
    position: 20,
  }
)

pa1 = Party.find_or_initialize_by(id: 1)
pa1.update_attributes(
  {
    enable: true,
    name: "選べる満足コース！3時間飲み放題付7品♪【3500円/人】",
    position: 10,
    lead: "時間はたっぷり3時間！
飲み放題もついて満足できること間違いなし！
みなさんで「ダーツ」に「会話」に楽しんで、良い想い出を作ってください！

サプライズなどもお気軽にご相談ください♪",
    content: <<-CONTENT
制限時間：3時間
料理：下記7品
ドリンク：飲み放題
ダーツ：インコイン

【選べる】◎ ポテチ・ポップコーン・MIXナッツ・ビーフジャーキー・サルサチップ の中から2品
【選べる】◎ 彩りサラダ・生ハムサラダ の中から1品
◎ フライドポテト
◎ 鶏の唐揚げ
◎ ソーセージ盛り合わせ
【選べる】◎ パスタ・チャーハン・エビピラフ の中から1品
以上7品です！
CONTENT
  }
)

pa2 = Party.find_or_initialize_by(id: 2)
pa2.update_attributes(
  {
    enable: true,
    name: "選べるまんぷくコース！3時間飲み放題付9品♪【4500円/人】",
    position: 20,
    lead: "ほぼ誰でも満腹になれること間違いなし！
時間はたっぷり3時間！
たっぷり料理に飲み放題であとは「ダーツ」と「会話」に花を咲かせて良い想い出を作ってください！

サプライズなどもお気軽にご相談ください♪",
content: <<-CONTENT
制限時間：3時間
料理：下記9品
ドリンク：飲み放題
ダーツ：インコイン

【選べる】◎ ポテチ・ポップコーン・MIXナッツ・ビーフジャーキー・サルサチップ の中から2品
【選べる】◎ 彩りサラダ・生ハムサラダ の中から1品
◎ サーモンマリネ
◎ フライドポテト
◎ 鶏の唐揚げ
◎ ソーセージ盛り合わせ
◎ ローストビーブ
【選べる】◎ パスタ・チャーハン・エビピラフ の中から1品
以上9品です！
CONTENT
  }
)




CSV.foreach('db/seeds/menus.csv') do |row|
  m = Menu.find_or_initialize_by(name: row[1])
  m.update_attributes(enable: true, menu_category_id: row[0], name: row[1], amount: row[2])
end
