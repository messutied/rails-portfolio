json.array!(@links) do |portfolio_social_link|
  json.extract! portfolio_social_link, :id, :name, :user_name, :item_id
  json.url portfolio_social_link_url(portfolio_social_link, format: :json)
end
