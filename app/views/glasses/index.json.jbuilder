json.array!(@glasses) do |glass|
  json.extract! glass, :id, :frame_kind, :made_in, :quantity, :unity_price, :discount_rate, :type, :discount_rate_2
  json.url glass_url(glass, format: :json)
end
