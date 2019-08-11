FactoryBot.define do
  factory :order_one, class: "Order" do
    title { "First Order" }
  	description { "1st Order" }
  	deadline { "2019-07-04" }
  end

  factory :order_two, class: "Order" do
    title { "Second Order" }
  	description { "2nd Order" }
  	deadline { "2019-07-05" }
  end
end