json.data do
  json.array! @search_results, partial: "github_search/result", as: :search_result
end
