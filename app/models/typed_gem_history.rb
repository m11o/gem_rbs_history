class TypedGemHistory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :merged_at, type: DateTime
  field :gem_name, type: String
  field :gem_version, type: String
  field :user_id, type: String
  field :user_name, type: String
  field :pr_number, type: String
end
