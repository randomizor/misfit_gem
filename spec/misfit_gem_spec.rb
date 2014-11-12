require 'spec_helper'

describe MisfitGem do
  
  before do
    @client = MisfitGem::Client.new({
      :consumer_key => '12345',
      :consumer_secret => '67890'
    })
  end

  describe 'global settings' do
    it 'should expose the api_version' do
      expect(@client.api_version).to eq "v1"
    end

    it 'should allow clients to set a new api version' do
      @client.api_version = "v2"
      expect(@client.api_version).to eq "v2"
    end

  end
end