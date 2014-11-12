module MisfitGem
  class Client

    def get_profile
      get("/user/me/profile")
    end
    
  end
end
