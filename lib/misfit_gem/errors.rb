module MisfitGem
  class InvalidArgumentError < ArgumentError
  end

  class InvalidDateArgument < InvalidArgumentError
  end

  class InvalidDateRangeArgument < InvalidArgumentError
  end

  class ConnectionRequiredError < Exception
  end

  class DeprecatedApiError < Exception
  end
end