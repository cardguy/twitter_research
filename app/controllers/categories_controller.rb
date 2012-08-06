class CategoriesController < ApplicationController

  # Show a list of all categories
  def index
    @categories = Category.order(:title).limit(50)
    respond_with(@categories)
  end

  # Show a single category with all tweets
  def show
    @category = Category.includes(:tweets).
      order('tweets_at desc').find(params[:id])
    respond_with(@category)
  end

  # Show form for a new category
  def new
    @category = Category.new
    respond_with(@category)
  end

  # Save/create the new category with new params
  def create
    @category = Category.create(params[:category])
    flash.notice = "Great, you've created a custom category!" if !@category.new_record?
    respond_with(@category, location: categories_url)
  end

  # Show a form to let users edit form submitted
  def edit
    @category = Category.find(params[:id])
    respond_with(@category)
  end

  # Update the category after the edit form is submitted
  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with(@category)
  end

  # Delete a category
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with(@category)
  end

end
