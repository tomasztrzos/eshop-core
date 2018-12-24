FactoryBot.define do
  factory :order do
    status { [:created, :accepted, :sent, :canceled].sample }
    user_id { User.last.id }
  end
end
