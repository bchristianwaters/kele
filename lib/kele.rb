require "httparty"
require "json"



class Kele
    include JSON
    include HTTParty
    include Roadmap
    attr_accessor :bloc, :auth_token
    
    def initialize(username, password)
        @username = username
        @bloc = "https://www.bloc.io/api/v1"
        response = self.class.post("#{@bloc}/sessions", query: { email: username, password: password})
        if response["auth_token"]
            @auth_token = response["auth_token"]
        else
            raise ArgumentError.new("Invalid username and/or password")
        end
    end
    
    def get_me
       response = self.class.get("#{@bloc}/users/me", headers: { "authorization" => @auth_token }).body 
       JSON.parse response
    end
    
    def get_mentor_availability(id=nil)
       if id.nil?
           mentor_id = get_me["current_enrollment"]["mentor_id"]
       else
           mentor_id = id
       end
       JSON.parse self.class.get("#{@bloc}/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token }).body 
    end
    
    def get_messages(page=nil)
        if page.nil?
            JSON.parse self.class.get("#{@bloc}/message_threads", headers: { "authorization" => @auth_token }).body 
        else
            JSON.parse self.class.get("#{@bloc}/message_threads", headers: { "authorization" => @auth_token }, query: { page: page }).body 
        end
    end
    
    def create_message(recipient_id, subject, body)
       self.class.post("#{@bloc}/messages", headers: { "authorization" => @auth_token }, query: { sender: @username, recipient_id: recipient_id, subject: subject, "stripped-text" => body})
    end    
end