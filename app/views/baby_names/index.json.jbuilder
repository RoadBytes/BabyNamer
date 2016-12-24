json.array!(@baby_names) do |baby_name|
  json.extract! baby_name, :id, :name
  json.url baby_name_url(baby_name, format: :json)
end
