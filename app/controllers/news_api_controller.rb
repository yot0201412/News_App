class NewsApiController < ApplicationController
    # require 'net/https'
    require 'open-uri'
    require 'json'
    
    def show
        @cont = params[:cont]
        @category = params[:category]
        apikey = "c7f25b6f8a5146de81ec700487186d7b"
        
        if @cont != nil && @category != nil
            @url = "https://newsapi.org/v2/top-headlines?country=" + @cont + "&category=" + @category + "&apiKey="  + apikey
            
            # JSON形式をハッシュ形式にパース
            @result = JSON.parse(apipost(@url));
            @articles = @result['articles']
        end
    end
    
    def index
        @title = params[:title]
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    private
    
    def apipost(url)
        # uri = URI.parse(url)
        # http = Net::HTTP.new(uri.host, uri.port)
    
        # http.use_ssl = true
        # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
        # req = Net::HTTP::Post.new(uri.path)
        # # req.set_form_data({'status' => 'status', 'content' => 'articles'})
        
        # res = http.request(req)
        # return  ActiveSupport::JSON.decode(res.body)
        # # return  res
        
        req = open(url)
        response_body = req.read
        return response_body
    end
end
