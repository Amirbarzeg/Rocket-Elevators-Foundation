class HomeController < ApplicationController
  def index
  end

  def testpost
    json_data = {:aaData=> [["abc","xyz","lmnop"],["sdf","adsdf","sadfsd"],["sdf","adsdf","sadfsd"]]}.to_json
    respond_to do |format|
      format.json { render :json => json_data }
    end
  end
end
