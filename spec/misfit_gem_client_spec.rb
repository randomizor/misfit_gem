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

    it "makes a new access token after reconnecting" do
      client = described_class.new(consumer_key: 'key',
                                   consumer_secret: 'secret')
      token1 = client.reconnect('token1', 'secret1')
      token2 = client.reconnect('token2', 'secret2')
      expect(token1).not_to eq(token2)
    end
end
