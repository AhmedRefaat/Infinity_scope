json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :phone, :delivery_date, :work, :mobile, :address, :request_date, :cash, :paid, :remained, :lft_sp, :lft_cl, :lft_ax, :rght_sp, :rght_cl, :rght_ax, :doctor, :req_store, :deliv_store, :comment
  json.url customer_url(customer, format: :json)
end
