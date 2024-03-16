json.attributes do
  json.author search_result.dig("owner", "login")
  json.name search_result.dig("name")
  json.repository_url search_result.dig("html_url")
  json.stars search_result.dig("stargazers_count")
  json.rating search_result.dig("score")
end
