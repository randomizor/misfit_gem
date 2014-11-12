require 'spec_helper'

describe MisfitGem::Client do
  
    it "requires consumer_key" do
      expect {
        opts = { :consumer_secret => "12345" }
        client = MisfitGem::Client.new(opts)
      }.to raise_error(MisfitGem::InvalidArgumentError, "Missing required options: consumer_key")
    end

    it "requires consumer_secret" do
      expect {
        opts = { :consumer_key => "12345" }
        client = MisfitGem::Client.new(opts)
      }.to raise_error(MisfitGem::InvalidArgumentError, "Missing required options: consumer_secret")
    end
  
end