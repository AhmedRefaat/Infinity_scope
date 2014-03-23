json.array!(@stores) do |store|
  json.extract! store, :id, :title, :address, :phone, :mobile
  json.url store_url(store, format: :json)
end
