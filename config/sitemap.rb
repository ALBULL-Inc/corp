# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://railly.tokyo/'
SitemapGenerator::Sitemap.sitemaps_path = ''

SitemapGenerator::Sitemap.create do
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
#  add policy_privacy_path,      priority: 0.7, changefreq: 'daily'
#  add terms_path,               priority: 0.7, changefreq: 'daily'
  add new_inquiry_path,         priority: 0.7, changefreq: 'daily'
  add new_account_session_path, priority: 0.7, changefreq: 'daily'

  #add topics_path,         priority: 0.7, changefreq: 'daily'
  Topic.enables.find_each do |topic|
    add topic_path(topic),      priority: 0.5, changefreq: 'daily', lastmod: topic.publish_at
  end

  add stores_path,              priority: 0.7, changefreq: 'daily'
  Store.find_each do |store|
    add store_path(store),      priority: 0.5, changefreq: 'daily', lastmod: store.updated_at
  end

  add parties_path,             priority: 0.7, changefreq: 'daily'
  Party.enables.find_each do |party|
    add party_path(party),      priority: 0.5, changefreq: 'daily'
  end

  add plans_path,               priority: 0.7, changefreq: 'daily'
  Plan.find_each do |plan|
    add plan_path(plan),        priority: 0.5, changefreq: 'daily'
  end

  add blogs_path,               priority: 0.7, changefreq: 'daily'
  Blog.enables.find_each do |blog|
    add blog_path(blog),        priority: 0.5, changefreq: 'daily', lastmod: blog.publish_at
  end

  #add menus_path,               priority: 0.7, changefreq: 'daily'
  Menu.find_each do |menu|
    add menu_path(menu),        priority: 0.5, changefreq: 'daily', lastmod: menu.updated_at
  end
end
