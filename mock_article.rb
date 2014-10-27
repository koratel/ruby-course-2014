require_relative 'article'
require_relative 'article_manager'

class MockArticle < Article
  def random_number
    rand(100)
  end

  WORD_LIST = [
    "zero", "one", "two", "three", "four",
    "five", "six", "seven", "eight", "nine"
  ]

  def random_words(n)
    WORD_LIST.sample(n)
  end

  def generate_author
    random_words(2).collect { |word| word.capitalize }.join(" ")
  end

  def generate_title
    random_words(rand(4)+1).join(" ").capitalize
  end

  def generate_sentence
    random_words(rand(6)+5).join(" ").capitalize << "."
  end
end

