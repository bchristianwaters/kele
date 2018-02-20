module Roadmap
    def get_roadmap(roadmap=nil)
       if roadmap.nil?
          user_info = self.get_me() 
          roadmap = user_info["current_enrollment"]["roadmap_id"]
       end
        
       response = self.class.get("https://www.bloc.io/api/v1/roadmaps/#{roadmap}", headers: { "authorization" => @auth_token }).body 
       JSON.parse response

    end
    
    def get_checkpoint(checkpoint=nil)
       if checkpoint.nil?
          roadmap_info = self.get_roadmap() 
          checkpoint = roadmap_info["sections"][0]["checkpoints"][0]["id"]
       end
        
       response = self.class.get("https://www.bloc.io/api/v1/checkpoints/#{checkpoint}", headers: { "authorization" => @auth_token }).body 
       JSON.parse response
    
    end 
end