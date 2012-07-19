require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  setup do
    %w(Business Personal Money Entertainment).each do |title|
      Category.create!(title: title)
    end
  end


  test("suggested categories works correctly") do
    tweet = Tweet.new do |t|
      t.tweeted_text ="I wish I could get! for my10 #business to get off the ground #money"
    end

   assert_equal("Business, Money", tweet.suggested_categories)
   # assert_equal("Business", tweet.suggested_categories)
   # assert_equal("Money", tweet.suggested_categories)
  #  assert_equal("Ground", tweet.suggested_categories)
  end

end
