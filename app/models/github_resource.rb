require "net/http"

class GithubResource
  SEARCH_URL = 'https://api.github.com/search/repositories'.freeze

  def initialize(args)
    @args = args

    # Set default values
    @args["order"] = "desc" unless args["order"]
    @args["sort"] = "stars" unless args["sort"]
    @args["per_page"] = "10" unless args["per_page"]
    @args["page"] = "1" unless args["page"]
  end

  def search
    return missing_search_query_error if search_query_missing?

    response = Net::HTTP.get(uri, headers)
    parsed_response = JSON.parse(response)

    # If the response includes `message` key, it means the response was not
    # successful and we need to return errors.
    return parsed_response if parsed_response["message"]

    parsed_response["items"]
  end

  private

  def uri
    URI("#{SEARCH_URL}?#{build_query_params}")
  end

  def headers
    {
      Accept: "application/vnd.github.v3+json",
      "X-GitHub-Api-Version": "2022-11-28"
    }
  end

  def build_query_params
    query = "q=#{@args["q"]}"
    order = "&order=#{@args["order"]}"
    sort = "&sort=#{@args["sort"]}"
    per_page = "&per_page=#{@args["per_page"]}"
    page= "&page=#{@args["page"]}"

    query + order + sort + per_page + page
  end

  def search_query_missing?
    @args["q"].nil? || @args["q"].empty?
  end

  def missing_search_query_error
    {
      "message" => "Validation Failed",
      "errors" => [{ "resource" => "Search", "field" => "q", "code" => "missing" }],
      "documentation_url" => "https://docs.github.com/v3/search"
    }
  end
end
