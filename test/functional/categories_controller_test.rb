require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  include(Devise::TestHelpers)

  setup do
    @user = User.create! do |user|
      user.full_name = "Foo Bar"
      user.email = "foobar@test.com"
      user.password = "foobar"
      user.password_confirmation = "foobar"
    end
  end

  test("the create action makes a category") do
    sign_in(@user)


    # assert_difference('Category.count') do
    #   post(:create, :category => {:title => "Hello"})
    # end

    # assert_redirected_to(:action => :index)
  end

  # test("that the new action returns a form") do
  #   sign_in(@user)
  #   get(:new)
  #   assert_response(:success)
  #   # assert_select("form#new_category")
  # end

end
