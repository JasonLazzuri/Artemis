class HiringResultsController < ApplicationController
  def index
    @assessments = Assessment.paginate(:page => params[:page], :per_page => 10)
  end

  private
    def hiring_results_params
      params.fetch(:hiring_results, {})
    end
end
