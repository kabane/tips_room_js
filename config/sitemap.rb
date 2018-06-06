# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.tip-room-js.tokyo/"

SitemapGenerator::Sitemap.create do
  add "/", :priority=>0.8, :changefreq=>'monthly'
  add "/tips", :priority=>0.8, :changefreq=>'monthly'
  Tip.published_only.each do |tip|
    add "/tips/#{tip.id}", :priority=>1.0, :changefreq=>'monthly'
  end
end
