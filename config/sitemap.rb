# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://your-corp.jp/'
SitemapGenerator::Sitemap.sitemaps_path = ''

SitemapGenerator::Sitemap.create do
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  add about_us_path,            priority: 0.7, changefreq: 'daily'
  add mission_path,             priority: 0.7, changefreq: 'daily'
  add policy_childcare_path,    priority: 0.7, changefreq: 'daily'

  #add topics_path,              priority: 0.7, changefreq: 'daily'
  Topic.enables.find_each do |topic|
    add topic_path(topic),      priority: 0.5, changefreq: 'daily', lastmod: topic.publish_at
  end

  add recruits_path,            priority: 0.7, changefreq: 'daily'
  Recruit.enables.find_each do |recruit|
    add recruit_path(recruit),  priority: 0.5, changefreq: 'daily', lastmod: recruit.updated_at
  end

  add places_path,              priority: 0.7, changefreq: 'daily'
  Place.find_each do |place|
    add place_path(place),      priority: 0.5, changefreq: 'daily', lastmod: place.updated_at
  end

  add blogs_path,               priority: 0.7, changefreq: 'daily'
  Blog.enables.find_each do |blog|
    add blog_path(blog),        priority: 0.5, changefreq: 'daily', lastmod: blog.publish_at
  end
end
