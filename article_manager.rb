require_relative "article"

class ArticleManager
  def initialize(articles)
    @articles = articles
  end

  def worst_articles
    @articles.sort { |x,y| x.positive_votes <=> y.positive_votes }
  end

  def best_articles
    @articles.sort { |x,y| y.positive_votes <=> x.positive_votes }
  end
end
