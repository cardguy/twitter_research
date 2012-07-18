class Tweet < ActiveRecord::Base
  attr_accessible(:twitter_user, :twitter_text, :tweeted_at, :user_id)

  validates(:twitter_user, :presence => true)
  validates(:twitter_test, :presence => true)
  validates(:twitter_at, :presence => true)
  validates(:user_id, :presence => true)

  belongs_to(:user)
  has_and_belongs_to_many(:categories)


end

