require_relative "article"

class ArticleManager
  def initialize(articles)
    @articles = articles
  end

  def worst_articles
    @articles.sort { |art1, art2| art1.positive_votes <=> art2.positive_votes }
  end

  def best_articles
    @articles.sort { |art1, art2| art2.positive_votes <=> art1.positive_votes }
  end

  def worst_article
    worst_articles.first
  end

  def best_article
    best_articles.first
  end

  def most_popular_article
    @articles.sort { |art1, art2| art2.votes <=> art1.votes }.first
  end

  def include?(pattern)
    @articles.select { |art| art.include?(pattern) }
  end

  def authors
    @articles.collect { |art| art.author }.uniq!
  end

  def number_of_authors
    authors.size
  end

  def votes
    @articles.reduce(0) { |sum, art| sum + art.votes }
  end

  def to_s
    @articles.reduce('') { |str, art|  str + art.to_s + "\n" }
  end
end
