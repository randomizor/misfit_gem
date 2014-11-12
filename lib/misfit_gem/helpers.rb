module MisfitGem
  class Client

    def format_date(date)
      if date.is_a? String
        case date
          when 'today'
            return Date.today.strftime("%Y-%m-%d")
          when 'yesterday'
            return (Date.today-1).strftime("%Y-%m-%d")
          else
            unless date =~ /\d{4}\-\d{2}\-\d{2}/
              raise MisfitGem::InvalidDateArgument, "Invalid date (#{date}), must be in yyyy-MM-dd format"
            end
            return date
        end
      elsif Date === date || Time === date || DateTime === date
        return date.strftime("%Y-%m-%d")
      else
        raise MisfitGem::InvalidDateArgument, "Date used must be a date/time object or a string in the format YYYY-MM-DD; supplied argument is a #{date.class}"
      end
    end
    
    def check_date_range(start_date_string, end_date_string)
      
      start_date = Date.parse(start_date_string)
      end_date = Date.parse(end_date_string) 
      
      if (end_date - start_date > 30)
        raise MisfitGem::InvalidDateRangeArgument, "Dates must be less than 30 days apart"
      end
      
      if (end_date < start_date)
        raise MisfitGem::InvalidDateRangeArgument, "End date must be after start date"
      end
      
    end
    
  end
  
end
