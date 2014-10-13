class Article
  def initialize(title, content, author="")
    @title, @content, @author = title, content, author
    @likes = @dislikes = 0
  end

end
