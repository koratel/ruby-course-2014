require_relative '../../article'
require 'test/unit'

class Article
  attr_accessor :likes, :dislikes
end

class ArticleSpec < Test::Unit::TestCase
  def setup
    @content = "Content content content"
    @article = Article.new("Title", @content, "Author")
  end

  def test_like!
    10.times { @article.like! }
    assert_equal(10, @article.likes) 
  end

  def test_dislike!
    10.times { @article.dislike! }
    assert_equal(10, @article.dislikes)
  end

  def test_positive_votes
    assert_equal(@article.likes - @article.dislikes, @article.positive_votes)
  end

  def test_votes
    assert_equal(@article.likes + @article.dislikes, @article.votes)
  end

  def test_shortened
    assert_equal(@content, @article.shortened_to(50))
    assert_equal(@content[0] + "...", @article.shortened_to(4))
  end

  def test_include?
    assert(@article.include?("content"))
  end

  def test_words
    assert_equal(["Content", "content", "content"], @article.words)
  end

  def test_distinct_words
    assert_equal(["Content", "content"], @article.distinct_words)
  end
end

