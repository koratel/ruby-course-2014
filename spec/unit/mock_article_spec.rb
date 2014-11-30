require_relative '../../mock_article'
require_relative '../../article'
require 'test/unit'

class MockArticleSpec < Test::Unit::TestCase
  def setup
    @mock_article = MockArticle.new
  end

  def test_random_number
    assert(@mock_article.random_number.between?(0, 100))
  end
end
