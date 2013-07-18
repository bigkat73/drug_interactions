json.array!(@interactions) do |interaction|
  json.extract! interaction, 
  json.url interaction_url(interaction, format: :json)
end
