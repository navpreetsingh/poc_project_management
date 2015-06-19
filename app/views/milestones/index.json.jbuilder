json.array!(@milestones) do |milestone|
  json.extract! milestone, :id, :name, :description, :start_date, :end_date, :status
  json.url milestone_url(milestone, format: :json)
end
