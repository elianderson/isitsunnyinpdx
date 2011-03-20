class Weather < ActiveRecord::Base
	
     def Weather.isitsunny
       uri = 'http://query.yahooapis.com'
       request = '/v1/public/yql?q=select%20*%20from%20weather.bylocation%20where%20location%3D97217&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys'
       url = URI.parse(uri)
       apiRaw = Net::HTTP.start(url.host, url.port) {|http|
          http.get(request)
       }
       api = JSON.parse(apiRaw.body)
       text = api['query']['results']['weather']['rss']['channel']['item']['condition']['text'].downcase
        
      case text
      	when 'sunny'
         verdict = 'sunny'
       when 'partly sunny'
         verdict = "sunny"
       when 'mostly sunny'
         verdict = "sunny"
       when 'fair'
         verdict = "sunny"
       else
          verdict = "cloudy"
       end
     end
     
end
