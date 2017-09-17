stages_summary_sorted = @stages_summary.to_a.sort{|x, y| x[0]['percent'] <=> y[0]['percent']}

json.prettify!
json.array! stages_summary_sorted do |stage_summary|
  json.stage_name stage_summary[0]['name']
  json.deals_value stage_summary[1]
end
