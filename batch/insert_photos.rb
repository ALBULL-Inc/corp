# googleドキュメントの「施設の写真リリース手順」を参照
# rails runner batch/insert_photos.rb :施設名: :YEARMONTH: :フォルダ:


place_key = ARGV[0]
place = Place.find_by_key(place_key)
print "place: #{place.name}", "\n"
ym = ARGV[1]
month = Month.find_or_create_by(ym: ym)
print "month: #{month.ym}", "\n"
folder_path = ARGV[2]
files = Dir.open(folder_path)


files.each do |file|
  if file == "." or file == ".."
    next
  end
  f = File.open("#{files.path}/#{file}")
  photo = Photo.new(image: f)
  if photo.save
    place.photos << photo
    month.photos << photo
  end
end
