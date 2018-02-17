require "httparty"

class Kele
    include HTTParty
    attr_accessor :bloc, :auth_token
    
    def initialize(username, password)
        @bloc = "https://www.bloc.io/api/v1"
        response = self.class.post('https://www.bloc.io/api/v1/sessions', query: { email: username, password: password})
        if response["auth_token"]
            @auth_token = response["auth_token"]
        else
            raise ArgumentError.new("Invalid username and/or password")
        end
    end
end