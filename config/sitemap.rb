# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://albull.co.jp/'
SitemapGenerator::Sitemap.sitemaps_path = ''

SitemapGenerator::Sitemap.create do
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
#  add policy_privacy_path,      priority: 0.7, changefreq: 'daily' #noindex
#  add terms_path,               priority: 0.7, changefreq: 'daily' #noindex
#  add law_path,                 priority: 0.7, changefreq: 'daily' #noindex
  add new_inquiry_path,         priority: 0.7, changefreq: 'daily'
  add new_account_registration_path, priority: 0.7, changefreq: 'daily'
  add new_account_session_path, priority: 0.7, changefreq: 'daily'

  add topics_path,         priority: 0.7, changefreq: 'daily'
  Topic.where(topicable: nil).enables.find_each do |topic|
    add topic_path(topic),      priority: 0.5, changefreq: 'daily', lastmod: topic.publish_at
  end

  add stores_path,              priority: 0.7, changefreq: 'daily'
  Store.find_each do |store|
    add store_path(store.pkey), priority: 0.5, changefreq: 'daily', lastmod: store.updated_at
    add store_topics_path(store.pkey), priority: 0.5, changefreq: 'daily'
    store.topics.enables.each do |topic|
      add store_topic_path(store.pkey, topic), priority: 0.5, changefreq: 'daily', lastmod: topic.publish_at
    end
    add store_parties_path(store.pkey), priority: 0.5, changefreq: 'daily'
    store.parties.enables.each do |party|
      add store_party_path(store.pkey, party), priority: 0.5, changefreq: 'daily', lastmod: party.updated_at
    end
  end

#  add plans_path,               priority: 0.7, changefreq: 'daily'
#  Plan.find_each do |plan|
#    add plan_path(plan),        priority: 0.5, changefreq: 'daily'
#  end

  add blogs_path,               priority: 0.7, changefreq: 'daily'
  Blog.enables.find_each do |blog|
    add blog_path(blog),        priority: 0.5, changefreq: 'daily', lastmod: blog.publish_at
  end

  #add menus_path,               priority: 0.7, changefreq: 'daily'
  Menu.find_each do |menu|
    add menu_path(menu),        priority: 0.5, changefreq: 'daily', lastmod: menu.updated_at
  end
end
