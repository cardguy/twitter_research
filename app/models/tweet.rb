class Tweet < ActiveRecord::Base
  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :user_id)

  validates(:twitter_user, :presence => true)
  validates(:tweeted_text, :presence => true)
  validates(:twitter_at, :presence => true)
  validates(:user_id, :presence => true)

  belongs_to(:user)
  has_and_belongs_to_many(:categories)

  def suggested_categories
    titles = Category.all.map(&:title).map(&:downcase)
    tweet = tweeted_text.gsub(/[^\w\s]/, ' ').downcase.split.sort


    (tweet & titles).map(&:capitalize).sort.join(', ')


    # words = tweeted_text.gsub(/#/, '').split(/\s+/)
    # categories = Category.limit(30).all

   # tweet = tweeted_text.gsub(/#/, '').downcase.split(/\s+/)
   # titles = Category.all.map(&:title).map(&:downcase)

   # match = (tweet & titles)
   # match.map(&:titlecase).sort.join(', ')


    end

end

