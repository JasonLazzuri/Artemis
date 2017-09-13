class DiversityResultsController < ApplicationController
  before_action :set_diversity_result, only: [:index]

  def index
    @diversity_results = DiversityResult.all
    @respondents = Respondent.paginate(:page => params[:page], :per_page => 10)

    @section_one_score = 0
    @section_two_score = 0
    @section_three_score = 0
    @section_four_score = 0
    @section_five_score = 0
    @section_six_score = 0
    @section_seven_score = 0
  end



  private
    def set_diversity_result
    end

    def diversity_result_params
      params.fetch(:diversity_result, {})
    end
end
