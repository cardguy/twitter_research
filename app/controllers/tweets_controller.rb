class TweetsController < ApplicationController

  def index
    # current_user from Devise is associated with "tweets"
    @tweets = current_user.tweets.order('tweeted_at desc').limit(25)
    respond_with(@tweets)
  end

  def create
    @tweet = current_user.tweets.create(params[:tweet])
    respond_with(@tweet, :location => tweets_url)
  end

end
