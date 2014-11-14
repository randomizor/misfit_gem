module MisfitGem
  class Client

    def get_sessions(opts)
      
      missing = [:start_date, :end_date] - opts.keys
      if missing.size > 0
        raise MisfitGem::InvalidArgumentError, "Missing required options: #{missing.join(',')}"
      end
      
      start_date_string = format_date(opts[:start_date])
      end_date_string   = format_date(opts[:end_date])
      
      check_date_range(start_date_string, end_date_string)
      
      parameters = "start_date=#{start_date_string}&end_date=#{end_date_string}"
            
      get("/user/me/activity/sessions?#{parameters}")
      
    end
    
  end
end
