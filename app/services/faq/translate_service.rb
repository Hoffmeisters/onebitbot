module FaqModule
    class TranslateService
        def initialize(params)
            @query = params["query"]
        end

        def call            

          return "Nada para traduzir" if @query == nil

          #Aqui testei local passando os parametros direto e no heroku com com as variaveis de ambiente
          translate_api_url = ENV['TRANSLATE_API_URL']
          api_key = ENV['TRANSLATE_API_KEY']
    
          url = "#{translate_api_url}?key=#{api_key}&text=#{@query}&lang=pt-en"
          puts url
          res = RestClient.get url
    
          value = JSON.parse(res.body)["text"][0]

          (value == nil)? "Nada para traduzir" : value
        end
    end
end
