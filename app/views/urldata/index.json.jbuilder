json.array!(@urldata) do |urldatum|
  json.extract! urldatum, :id, :url, :text
  json.url urldatum_url(urldatum, format: :json)
end
