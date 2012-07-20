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
      t.tweeted_text ="I wish I could get! money for my10 #business to get off the ground #money"
    end
   assert_equal("Business, Money", tweet.suggested_categories)
  end

  #############################################################
  def test_setting_categories_from_string
    tweet = Tweet.new
    cat = Category.where(title: "Business").first
    assert(cat)

    tweet.categories << cat
    assert_equal(1, tweet.categories.size)

    tweet.categories_as_string = "Money, Personal"
    assert_equal(2, tweet.categories.size)
    assert_equal(%w(Money Personal),
                 tweet.categories.map(&:title).sort)

  end

end
