require "httparty"
require "json"

class Kele
    include JSON
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
    
    def get_me
       response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { "authorization" => @auth_token }).body 
       JSON.parse response
    end
    
    def get_mentor_availability
       user_info = self.get_me()
       mentor_id = user_info["current_enrollment"]["mentor_id"]
       response = self.class.get("https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token }).body 
       JSON.parse response
    end
end