class DandiresultsController < ApplicationController
  before_action :set_dandiresult, only: [:index]

  # GET /dandiresults
  def index
    @results = Response.all
    @user_id = Respondent.all
    
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dandiresult
    end

    # Only allow a trusted parameter "white list" through.
    def dandiresult_params
      params.fetch(:dandiresult, {})
    end
end
