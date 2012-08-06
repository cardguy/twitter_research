class SearchesController < ApplicationController

  def index
  end

  def show
    search = SimpleTwitter::Search.new
    search.results_per_page = params[:rpp]
    search.language = params[:lang]
    @results = search.search(params[:q])
    flash.notice = "Search completed"
  end

end
