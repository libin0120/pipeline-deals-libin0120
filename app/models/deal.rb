class Deal
  include ActiveModel::Model

  attr_accessor :id, :name, :value, :deal_stage_id, :deal_stage

  validates :id, :name, :value, :deal_stage_id, :deal_stage, presence: true

  def id=(val)
    @id = val.to_i
  end

  def value=(val)
    @value = BigDecimal.new(val) # val.to_f
  end

  def deal_stage_id=(val)
    @deal_stage_id = val.to_i
  end

  def deal_stage=(val)
    @deal_stage = val
    @deal_stage['id'] = val['id'].to_i
    @deal_stage['percent'] = val['percent'].to_i
  end
end