json.array!(@people_yearbooks) do |people_yearbook|
  json.extract! people_yearbook, :id
  json.url people_yearbook_url(people_yearbook, format: :json)
end
