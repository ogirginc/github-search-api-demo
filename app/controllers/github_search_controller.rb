class GithubSearchController < ApplicationController
  def index
    @search_results = GithubResource.new(search_params).search

    respond_to do |format|
      format.json do
        if @search_results.is_a?(Array)
          render :index
        else
          render :error
        end
      end
    end
  end

  private

  def search_params
    params.permit(:q, :order, :sort, :per_page, :page, :format)
  end
end
