class DealsController < ApplicationController

  # GET /deals
  # GET /deals.json
  def index
    @deals = []

    RestClient.get "#{API_ENDPOINT}/deals.json?api_key=#{API_KEY}" do |response|

      response_hash = JSON.parse(response)

      @deals += response_hash['entries'].map {|entry| Deal.new(entry.slice 'name', 'value', 'deal_stage_id', 'deal_stage')}
    end


  end

end
