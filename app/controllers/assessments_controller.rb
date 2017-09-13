class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]


  def index
    @assessments = Assessment.all
  end

  def show
    @assessments = Assessment.find(params[:id])

    @remoteScore = @assessments.remoteOneValue + @assessments.remoteTwoValue + @assessments.remoteThreeValue + @assessments.remoteFourValue + @assessments.remoteFiveValue;

    @strategyScore = @assessments.strategyOneValue + @assessments.strategyTwoValue + @assessments.strategyThreeValue + @assessments.strategyFourValue + @assessments.strategyFiveValue + @assessments.strategySixValue;

    @totalScore = @assessments.remoteOneValue + @assessments.remoteTwoValue + @assessments.remoteThreeValue + @assessments.remoteFourValue + @assessments.remoteFiveValue + @assessments.strategyOneValue + @assessments.strategyTwoValue + @assessments.strategyThreeValue + @assessments.strategyFourValue + @assessments.strategyFiveValue + @assessments.strategySixValue;
  end


  def intro
  end

  def new
    @assessment = Assessment.new
  end



  def create
    @assessment = Assessment.new(assessment_params)

    respond_to do |format|
      if @assessment.save
        format.html { redirect_to @assessment, notice: 'Assessment was successfully created.' }
        format.json { render :show, status: :created, location: @assessment }
      else
        format.html { render :new }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    def set_assessment
      @assessment = Assessment.find(params[:id])
    end

    def assessment_params
      params.fetch(:assessment).permit(:remoteOneValue,:remoteTwoValue,:remoteThreeValue, :remoteFourValue, :remoteFiveValue, :strategyOneValue, :strategyTwoValue, :strategyThreeValue, :strategyFourValue, :strategyFiveValue, :strategySixValue, :name, :email)
    end
end
