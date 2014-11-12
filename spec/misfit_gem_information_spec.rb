require 'spec_helper'

describe MisfitGem::Client do
  
  before(:each) do
    @client = MisfitGem::Client.new({
      :consumer_key => '12345',
      :consumer_secret => '67890'
    })
  end
  
  describe "#get_profile" do
    
    it "returns the correct uri for current profile" do
      expect(@client).to receive(:get).with("/user/me/profile")
      @client.get_profile
    end
    
  end
  
  describe "#get_device" do
    
    it "returns the correct uri for current device" do
      expect(@client).to receive(:get).with("/user/me/device")
      @client.get_device
    end
    
  end
  
end