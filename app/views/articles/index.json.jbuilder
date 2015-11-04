json.array!(@articles) do |article|
  json.extract! article, :id, :article_title, :article_type, :article_content, :aritle_read_times, :user_id
  json.url article_url(article, format: :json)
end
