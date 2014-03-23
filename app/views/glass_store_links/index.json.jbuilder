json.array!(@glass_store_links) do |glass_store_link|
  json.extract! glass_store_link, :id, :glass_id, :store_id, :quantity
  json.url glass_store_link_url(glass_store_link, format: :json)
end
