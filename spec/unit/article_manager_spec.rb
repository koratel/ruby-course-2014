require_relative '../../article_manager'
require_relative '../../article'
require 'test/unit'

class ArticleManager
  attr_accessor :likes, :dislikes
end

class ArticleManagerSpec < Test::Unit::TestCase
  def setup
    @content = "content content"
    @author = "Author"
    @art1 = Article.new("Title", @content, @author)
    @art2 = Article.new("Title2", @content.capitalize, @author)
    @art3 = Article.new("Title", @content, @author)
    1.times { @art1.like! }
    2.times { @art2.like! }
    3.times { @art3.dislike! }
    @manager = ArticleManager.new([@art1, @art2, @art3])
  end

  def test_worst_articles
    assert_equal([@art3, @art1, @art2], @manager.worst_articles)
  end

  def test_best_articles
    assert_equal([@art2, @art1, @art3], @manager.best_articles)
  end

  def test_worst_article
    assert_equal(@art3, @manager.worst_article)
  end

  def test_best_article
    assert_equal(@art2, @manager.best_article)
  end

  def test_most_popular_article
    assert_equal(@art3, @manager.most_popular_article)
  end

  def test_include?
    assert_equal([@art2], @manager.include?("Content"))
  end

  def test_authors
    assert_equal([@author], @manager.authors)
  end

  def test_number_of_authors
    assert_equal(1, @manager.number_of_authors)
  end

  def test_votes
    assert_equal(6, @manager.votes)
  end
end
