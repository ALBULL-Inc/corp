month1710 = Month.find_by(ym: "201710")
month1711 = Month.find_by(ym: "201711")
month1712 = Month.find_by(ym: "201712")
month1801 = Month.find_by(ym: "201801")
month1802 = Month.find_by(ym: "201802")
month1803 = Month.find_by(ym: "201803")

# ひまわり
hmwr = Place.where(key: :himawari).first
hmwr.children.each do |child|
  child.used!(hmwr, month1710)
  child.used!(hmwr, month1711)
  child.used!(hmwr, month1712)
  child.used!(hmwr, month1801)
  child.used!(hmwr, month1802)
  child.used!(hmwr, month1803)
end


# ひだまり
hdmr = Place.where(key: :hidamari).first
codes = %{ h7j0nw U_5wLg b8kg0g cH8opg }
codes.each do |code|
  Family.find_code(code).children.each do |child|
    child.used!(hdmr, month1711)
    child.used!(hdmr, month1712)
    child.used!(hdmr, month1801)
    child.used!(hdmr, month1802)
    child.used!(hdmr, month1803)
  end
end

# はーと
heart = Place.where(key: :heart).first
codes = %{ oDQO8A dwWiOg 5mrzxQ Uo1lPw ftPK6A }
codes.each do |code|
  Family.find_code(code).children.each do |child|
    child.used!(heart, month1711)
    child.used!(heart, month1712)
    child.used!(heart, month1801)
    child.used!(heart, month1802)
    child.used!(heart, month1803)
  end
end
