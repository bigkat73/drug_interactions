json.array!(@medications) do |medication|
  json.extract! medication, :nui, :name
  json.url medication_url(medication, format: :json)
end
