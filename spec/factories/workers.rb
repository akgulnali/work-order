FactoryBot.define do
  factory :worker_one, class: "Worker" do
    name { "First Worker" }
  	company_name { "Company A" }
  	email { "first@mail.com" }
  end

  factory :worker_two, class: "Worker" do
    name { "Second Worker" }
  	company_name { "Company B" }
  	email { "second@mail.com" }
  end
end