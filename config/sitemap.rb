# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://your-corp.jp/'
SitemapGenerator::Sitemap.sitemaps_path = ''

SitemapGenerator::Sitemap.create do
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  add about_us_path, priority: 0.7
  add recruits_path, priority: 0.7
  add new_inquiry_path, priority: 0.7
  add new_account_session_path, priority: 0.7

  add mission_path, priority: 0.5
  add policy_childcare_path, priority: 0.5
  add places_path, priority: 0.5
end
