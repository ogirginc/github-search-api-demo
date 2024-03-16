require "test_helper"

class GithubResourceTest < ActiveSupport::TestCase
  test "return 10 items" do
    search_items = VCR.use_cassette("search example") do
      search_params = {
        "q"        => "example",
        "order"    => "desc",
        "sort"     => "stars",
        "per_page" => "15",
        "page"     => "1"
      }

      GithubResource.new(search_params).search
    end

    assert_equal 15, search_items.length
  end

  test "use default query params" do
    search_items = VCR.use_cassette("default values query params") do
      search_params = { "q" => "example" }
      GithubResource.new(search_params).search
    end

    assert_equal 10, search_items.length
  end

  test "missing query error" do
    returned_error_message = VCR.use_cassette("missing query error") do
      search_params = {
        "q"        => "",
        "order"    => "desc",
        "sort"     => "stars",
        "per_page" => "10",
        "page"     => "1"
      }

      GithubResource.new(search_params).search
    end

    error_message = {
      "message" => "Validation Failed",
      "errors" => [{ "resource" => "Search", "field" => "q", "code" => "missing" }],
      "documentation_url" => "https://docs.github.com/v3/search"
    }

    assert_equal error_message, returned_error_message
  end

  test "rate limit error" do
    returned_error_message = VCR.use_cassette("rate limit exceeded error") do
      search_params = {
        "q"        => "example",
        "order"    => "desc",
        "sort"     => "stars",
        "per_page" => "15",
        "page"     => "1"
      }

      GithubResource.new(search_params).search
    end

    error_message = {
      "message" => "API rate limit exceeded for 31.223.86.76. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)",
      "documentation_url" => "https://docs.github.com/rest/overview/resources-in-the-rest-api#rate-limiting"
    }

    assert_equal error_message, returned_error_message
  end
end
