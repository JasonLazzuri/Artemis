class HiringResultsController < ApplicationController


  def index
    @assessments = Assessment.paginate(:page => params[:page], :per_page => 10)
  end


  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def hiring_results_params
      params.fetch(:hiring_results, {})
    end
end
