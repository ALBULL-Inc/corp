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
    pkey: "railly-akasaka",
    name: "Darts Bar Railly",
    postcode: 1070052,
    region: "東京都",
    locality: "港区",
    address: "赤坂2-14-8",
    building: "赤坂SKビル3F-A",
    tel: "0368074025",
    fax: "0368074024",
    opening_time: "18:00",
    closing_time: "05:00",
    regular_holiday: "原則日曜日※月曜が祝日の場合は日曜営業の月曜休み",
    opened_on: "2018-01-04",
    closed_on: nil,
    position: 10,
    gmap_query: "pb=!1m18!1m12!1m3!1d3241.2026038076124!2d139.73609731525855!3d35.67201298019645!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x60188b86dd390f13%3A0x3b7e17727a060986!2sDarts+Bar+Railly!5e0!3m2!1sja!2sjp!4v1541042053189",
    latitude: 35.67208,
    longitude: 139.738217,
    near_station: "赤坂駅徒歩2分!\n溜池山王駅徒歩3分!!\n赤坂見附駅徒歩8分!!!",
    spec: "ダーツ: DARTSLIVE2 x 3\ntouchlive x 1\n月替りスロット x 1\nけん玉: ノーマル x 1　電玉(IoTけん玉) x 1\nneu(ノイ)[カードゲーム] x 1\n\nカウンター7席\n2人掛けテーブル×4\n2人掛け丸テーブルx1\n着席合計 17名\n\nスタンディング収容人数20名程度\n\n壁掛け50インチモニター\n音響設備あり(SPx2 MICx1)",
  facebook_uid: "railly.AKASAKA",
  twitter_uid: "DartsBarRailly",
  instagram_uid: "DartsBarRailly"
  }
)
s2 = Store.find_or_initialize_by(id: 2)
s2.update_attributes(
  {
    enable: false,
    pkey: "lockstock-omiya",
    name: "cafe&bar LOCKSTOCK",
    postcode: 3330854,
    region: "埼玉県",
    locality: "さいたま市大宮区",
    address: "桜木町1-175",
    building: "KGビル2F",
    tel: "0487883144",
    fax: "0487883299",
    opening_time: "18:00",
    closing_time: "05:00",
    regular_holiday: "",
    opened_on: "2020-08-17",
    closed_on: nil,
    position: 20,
  }
)

pa1 = Party.find_or_initialize_by(id: 1)
pa1.update_attributes(
  {
    enable: true,
    store_id: 1,
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
    store_id: 1,
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
  m.update_attributes(enable: true, store_id: 1, menu_category_id: row[0], name: row[1], amount: row[2])
end
