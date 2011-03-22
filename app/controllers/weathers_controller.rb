class WeathersController < ApplicationController
  # GET /weathers
  # GET /weathers.xml
  def index
	@weather = Weather.isitsunny
	
	if @weather == 'sunny'
		render :template => 'weathers/sunny'
	else
		render :template => 'weathers/not-sunny'
	end
  end
  
  def sunny
	render :template => 'weathers/sunny'
  end
  
  def notSunny
	render :template => 'weathers/not-sunny'
  end
 
 def api_view
 	@weather = Weather.connect_to_api
 	render :template => 'weathers/api-view'
 end
end
