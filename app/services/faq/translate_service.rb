module FaqModule
    class TranslateService
        def initialize(params)
            @query = params["query"]
        end

        def call            
          #Para testar inserir real valor no local das env vars, já em produção criar as env vars no heroku

          translate_api_url = ENV['TRANSLATE_API_URL']
          api_key = ENV['TRANSLATE_API_KEY']
    
          url = "#{translate_api_url}?key=#{api_key}&text=#{@query}&lang=pt-en"
          res = RestClient.get url
    
          value = JSON.parse(res.body)["text"][0]
        end
    end
end
