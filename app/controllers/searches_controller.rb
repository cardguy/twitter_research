class SearchesController < ApplicationController

  def index
  end

  def show
    search = SimpleTwitter::Search.new
    @results = search.search(params[:q])
    search.results_per_page = params[:rpp]
  end

end
