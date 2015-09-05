json.array!(@items) do |item|
  json.extract! item, :id, :key, :title, :summary
  json.url portfolio_item_url(item, format: :json)
end
