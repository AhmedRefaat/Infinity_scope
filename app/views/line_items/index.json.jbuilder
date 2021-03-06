json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :glass_id, :customer_id, :integer, :quantity
  json.url line_item_url(line_item, format: :json)
end
