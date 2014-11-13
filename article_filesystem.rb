require_relative 'article'

class ArticleFilesystem
  ARTICLES_FOLDER = "articles/"

  def self.write(article)
    if !Dir.exists?(ARTICLES_FOLDER)
      Dir.mkdir(ARTICLES_FOLDER)
    end
    path = article.title.downcase.split.join("_")
    File.open(ARTICLES_FOLDER + path, 'w') do |file|
      file.write(
        "#{article.author}|#{article.title}|#{article.content}|" +
        "#{article.likes}|#{article.dislikes}"
      )
    end
  end
end
