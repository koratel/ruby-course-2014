require 'stamp'

class Article
  attr_reader :title, :content, :author, :likes, :dislikes, :created_at
  def initialize(title, content, author="")
    @title, @content, @author = title, content, author
    @likes = @dislikes = 0
    @created_at = Time.now
  end

  def like!
    @likes += 1
  end

  def dislike!
    @dislikes += 1
  end

  def positive_votes
    @likes - @dislikes
  end

  def votes
    @likes + @dislikes
  end

  def shortened_to(limit)
    if limit >= @content.length 
      @content
    else 
      @content[0..limit-4] << "..."
    end
  end

  def include?(pattern)
    @content.include?(pattern)
  end

  def words
    @content.split
  end

  def distinct_words
    words.uniq
  end

  def to_s
    '"' + @title + '", ' + @author + "\n" + shortened_to(40) + "\n" + @created_at.to_s + "\n"
  end

  def created_stamp
    @created_at.stamp_like("Sunday, May 1, 2000")
  end
end
