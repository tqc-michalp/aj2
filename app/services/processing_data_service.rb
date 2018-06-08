# Service parsing into db retrived data
class ProcessingDataService
  def initialize(incoming_data)
    @incoming_data = incoming_data
  end

  def execute
    data_manipulation
  end

  private

  def standarize_items_to_attribiutes
    @standarized_data = []
    @incoming_data.each do |item|
      item[:user_id] = item.delete(:userId)
      @standarized_data.push(item)
    end
  end

  def feed_user(user)
    User.create!(id: user) unless User.exists?(id: user)
  end

  def feed_article(article)
    article = Article.find(article[:id])
  rescue ActiveRecord::RecordNotFound
    Article.create!(article)
  else
    article.update_attributes(article)
  end

  def data_manipulation
    standarize_items_to_attribiutes
    @standarized_data.each do |item|
      feed_user(item[:user_id])
      feed_article(item)
    end
  end
end
