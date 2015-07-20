json.array!(@doe_kinds) do |doe_kind|
  json.extract! doe_kind, :id, :name
  json.url doe_kind_url(doe_kind, format: :json)
end
