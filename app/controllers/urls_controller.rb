class UrlsController < ApplicationController
  
  def index
    @title = "Top URLs in our database"
    @url_list = Url.find_top_urls
  end
  
  def show
    @title = "Our URLs"
    @selected_url = Url.find(params[:id])
  end
  
  def new
    @title = "Add a new URL"
  end
  
  def create
    @title = "Save"
  end

end
