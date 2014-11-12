module MisfitGem
  class Client

    def get_device
      get("/user/me/device")
    end
    
  end
end
