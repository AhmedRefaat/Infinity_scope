json.array!(@empolyees) do |empolyee|
  json.extract! empolyee, :id, :name, :phone, :mobile, :address, :national_id, :mobile_2, :birthday, :age, :role, :salary, :comment
  json.url empolyee_url(empolyee, format: :json)
end
