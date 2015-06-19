st = ["Active", "Inactive", "Closed"]
FactoryGirl.define do
  factory :project do  	
	    name { FFaker::Company.name }
	    description "Testing"
	    start_date { (rand()*10).to_i.days.ago }
	    end_date { Time.now + ((rand() * 100).days) }
	    status { st[(rand() * 100).to_i % 3] }	  
  end
end