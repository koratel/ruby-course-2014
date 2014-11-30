require_relative 'article'
require 'bla-bla'

class MockArticle < Article

  def random_number
    rand(101)
  end

  def initialize
    super(BlaBla.generate_title, BlaBla.generate_content, BlaBla.generate_author)
    @likes, @dislikes = random_number, random_number
  end
end

