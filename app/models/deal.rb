class Deal

  include ActiveModel::Model

  attr_accessor :id, :name, :value, :status, :deal_stage_id, :deal_stage

  validates :name, presence: true
end