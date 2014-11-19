require 'spec_helper'

describe MisfitGem::Client do
  
  before(:each) do
    @client = MisfitGem::Client.new({
      :consumer_key => '12345',
      :consumer_secret => '67890'
    })
  end
  
  describe '#get_goals' do
    
    before(:each) do
      @opts = {start_date: "2014-11-13", end_date: "2014-11-21"}
    end

    it 'raises an exception if the :start_date value is missing' do
      @opts.delete :start_date
      expect {
        @client.get_goals @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end

    it 'raises an exception if the :end_date value is not missing' do
      @opts.delete :end_date
      expect {
        @client.get_goals @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end
        
    it 'raises an exception if the date range is greater than 30 days' do
      
      @opts[:start_date] = "2014-11-01"
      @opts[:end_date] = "2014-12-30"
      
      expect {
        @client.get_goals @opts
      }.to raise_error(MisfitGem::InvalidDateRangeArgument)
      
    end
    
    it 'raises an exception if the end date is before the start date' do
      
      @opts[:start_date] = "2014-12-30"
      @opts[:end_date] = "2014-11-01"
      
      expect {
        @client.get_goals @opts
      }.to raise_error(MisfitGem::InvalidDateRangeArgument)
      
    end
        
  end
  
  describe '#get_summary' do
    
    before(:each) do
      @opts = {start_date: "2014-11-13", end_date: "2014-11-21"}
    end

    it 'raises an exception if the :start_date value is missing' do
      @opts.delete :start_date
      expect {
        @client.get_summary @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end

    it 'raises an exception if the :end_date value is not missing' do
      @opts.delete :end_date
      expect {
        @client.get_summary @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end
        
    it 'raises an exception if the date range is greater than 30 days' do
      
      @opts[:start_date] = "2014-11-01"
      @opts[:end_date] = "2014-12-30"
      
      expect {
        @client.get_summary @opts
      }.to raise_error(MisfitGem::InvalidDateRangeArgument)
      
    end
    
    it 'raises an exception if the end date is before the start date' do
      
      @opts[:start_date] = "2014-12-30"
      @opts[:end_date] = "2014-11-01"
      
      expect {
        @client.get_summary @opts
      }.to raise_error(MisfitGem::InvalidDateRangeArgument)
      
    end
        
  end
  
  describe '#get_summary' do
    
    before(:each) do
      @opts = {start_date: "2014-11-13", end_date: "2014-11-21"}
    end

    it 'raises an exception if the :start_date value is missing' do
      @opts.delete :start_date
      expect {
        @client.get_summary @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end

    it 'raises an exception if the :end_date value is not missing' do
      @opts.delete :end_date
      expect {
        @client.get_summary @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end
        
    it 'raises an exception if the date range is greater than 30 days' do
      
      @opts[:start_date] = "2014-11-01"
      @opts[:end_date] = "2014-12-30"
      
      expect {
        @client.get_summary @opts
      }.to raise_error(MisfitGem::InvalidDateRangeArgument)
      
    end
    
    it 'raises an exception if the end date is before the start date' do
      
      @opts[:start_date] = "2014-12-30"
      @opts[:end_date] = "2014-11-01"
      
      expect {
        @client.get_summary @opts
      }.to raise_error(MisfitGem::InvalidDateRangeArgument)
      
    end
        
  end

  describe '#get_sleeps' do
    
    before(:each) do
      @opts = {start_date: "2014-11-13", end_date: "2014-11-21"}
    end

    it 'raises an exception if the :start_date value is missing' do
      @opts.delete :start_date
      expect {
        @client.get_sleeps @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end

    it 'raises an exception if the :end_date value is not missing' do
      @opts.delete :end_date
      expect {
        @client.get_sleeps @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end
        
    it 'raises an exception if the date range is greater than 30 days' do
      
      @opts[:start_date] = "2014-11-01"
      @opts[:end_date] = "2014-12-30"
      
      expect {
        @client.get_sleeps @opts
      }.to raise_error(MisfitGem::InvalidDateRangeArgument)
      
    end
    
    it 'raises an exception if the end date is before the start date' do
      
      @opts[:start_date] = "2014-12-30"
      @opts[:end_date] = "2014-11-01"
      
      expect {
        @client.get_sleeps @opts
      }.to raise_error(MisfitGem::InvalidDateRangeArgument)
      
    end
        
  end
  
  describe '#get_sleep' do
    
    before(:each) do
      @opts = {id: "12345"}
    end

    it 'raises an exception if the :id value is missing' do
      @opts.delete :id
      @opts[:invalid] = "Invalid"
      expect {
        @client.get_sleep @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end
    
  end    
  
  describe '#get_goal' do
    
    before(:each) do
      @opts = {id: "12345"}
    end

    it 'raises an exception if the :id value is missing' do
      @opts.delete :id
      @opts[:invalid] = "Invalid"
      expect {
        @client.get_goal @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end
    
  end
  
  describe '#get_session' do
    
    before(:each) do
      @opts = {id: "12345"}
    end

    it 'raises an exception if the :id value is missing' do
      @opts.delete :id
      @opts[:invalid] = "Invalid"
      expect {
        @client.get_session @opts
      }.to raise_error(MisfitGem::InvalidArgumentError)
    end
    
  end    
    
  
end