class DealsController < ApplicationController

  # GET /deals
  # GET /deals.json
  def index
    @deals = []
    @stages = {}
    @stages_summary = {}

    @stages_summary_sorted_names = []
    @stages_summary_sorted_values = []


    RestClient.get "#{API_ENDPOINT}/deals.json?api_key=#{API_KEY}" do |response|

      response_hash = JSON.parse(response)

      @deals += response_hash['entries'].map do |entry|

        deal = Deal.new(entry.slice 'name', 'value', 'deal_stage_id', 'deal_stage')

        @stages[deal.deal_stage_id] ||= deal.deal_stage # Add new deal_stage record if not existing

        @stages_summary[deal.deal_stage] ||= 0.0 # Initialize deal_stage total value as 0 if not existing yet

        @stages_summary[deal.deal_stage] += deal.value

        deal
      end
    end

    @stages_summary.keys.sort{|x, y| x['percent'] <=> y['percent'] }.each do |stage|
      @stages_summary_sorted_names << stage['name']
      @stages_summary_sorted_values << @stages_summary[stage].to_f
    end

    # Set chart object


    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Deals summarized based on stages")
      f.xAxis(categories: @stages_summary_sorted_names)
      f.series(name: "Total deal values grouped by stage", yAxis: 0, data: @stages_summary_sorted_values)

      f.yAxis [
                {title: {text: "Total deal values grouped by stage"} }
              ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "column"})
    end

  end

end
