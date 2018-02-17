class Kele
    include HTTParty
    
    def initialize(username, password)
         @username = username
         @password = password
         @bloc = "https://www.bloc.io/api/v1"
    #     values = '{  
    #                 "email": #{@username},
    #                 "password": "#{@password}"
    #               }'

    #     headers = {
    #         :content_type => 'application/json'
    #     }

    #     response = self.class.post 'https://www.bloc.io/api/v1/sessions', values, headers
    #     print response
    end
end