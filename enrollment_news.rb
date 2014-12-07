require 'nokogiri'
require 'open-uri'
require 'openssl'
require_relative 'article_filesystem'

class EnrollmentNews
  NEWS_URL = "https://zapisy.ii.uni.wroc.pl/news/"

  def self.download_news
    news_doc = Nokogiri::HTML(open(NEWS_URL, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    news_doc.css("div.od-news-item").collect do |news_node|
      title = news_node.css("div.od-news-header h3").text
      content = news_node.css("div.od-news-body").text
      author = news_node.css("div.od-news-footer").text.strip
      Article.new(title, content, author)
    end
  end

  def self.save_news
    download_news.each { |news| ArticleFilesystem.write(news) }
  end
end
