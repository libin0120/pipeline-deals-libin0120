class DealsController < ApplicationController

  # GET /deals
  # GET /deals.json
  def index
    @deals = []
    @stages = {}
    @stages_summary = {}


    RestClient.get "#{API_ENDPOINT}/deals.json?api_key=#{API_KEY}" do |response|

      response_hash = JSON.parse(response)

      @deals += response_hash['entries'].map do |entry|

        deal = Deal.new(entry.slice 'name', 'value', 'deal_stage_id', 'deal_stage')

        @stages[deal.deal_stage_id] ||= deal.deal_stage # Add new deal_stage record if not existing

        @stages_summary[deal.deal_stage] ||= 0 # Initialize deal_stage total value as 0 if not existing yet

        @stages_summary[deal.deal_stage] += deal.value

        deal
      end
    end


  end

end
