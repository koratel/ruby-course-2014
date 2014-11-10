require_relative '../../mock_article'
require_relative '../../article'
require 'test/unit'

class MockArticleSpec < Test::Unit::TestCase
  def setup
    @mock_article = MockArticle.new
    @word_list = MockArticle::WORD_LIST
  end

  def test_random_number
    assert(@mock_article.random_number.between?(0, 100))
  end

  def test_random_words
    assert_equal(10, @mock_article.random_words(10).size)
    assert(@mock_article.random_words(10).all? { |word| @word_list.include?(word) })
  end

  def test_generate_author
    assert(/\A[A-Z][a-z]* [A-Z][a-z]*\Z/ === @mock_article.generate_author)
  end

  def test_generate_title
    assert(/\A[A-Z][a-z]*( [a-z]+){,4}\Z/ === @mock_article.generate_title)
  end

  def test_generate_sentence
    assert(/\A[A-Z][a-z]*( [a-z]+){,9}.\Z/ === @mock_article.generate_sentence)
  end

  def test_generate_content
    assert(/\A[A-Z][a-z]*( [a-z]+){,9}.( [A-Z][a-z]*( [a-z]+){,9}.){,4}\Z/ === @mock_article.generate_content)
  end
end
