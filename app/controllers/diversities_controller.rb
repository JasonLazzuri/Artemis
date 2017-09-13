class DiversitiesController < ApplicationController
  before_action :set_diversity, only: [:show, :edit, :update, :destroy]

  # GET /diversities
  # GET /diversities.json
  def index
    @diversities = Diversity.all
  end

  def intro
  end  

  # GET /diversities/1
  # GET /diversities/1.json
  def show
    @dandi = Diversity.find(params[:id])

    diverse = @dandi.diversityOneValue + @dandi.diversityTwoValue + @dandi.diversityThreeValue + @dandi.diversityFourValue + @dandi.diversityFiveValue + @dandi.diversitySixValue + @dandi.diversitySevenValue + @dandi.diversityEightValue +  @dandi.diversityNineValue + @dandi.diversityTenValue
    @diversityScore = diverse/10/5.to_f


    employee = @dandi.employmentOneValue + @dandi.employmentTwoValue + @dandi.employmentThreeValue + @dandi.employmentFourValue + @dandi.employmentFiveValue + @dandi.employmentSixValue + @dandi.employmentSevenValue + @dandi.employmentEightValue + @dandi.employmentNineValue + @dandi.employmentTenValue + @dandi.employmentElevenValue + @dandi.employmentTwelveValue + @dandi.employmentThirteenValue + @dandi.employmentFourteenValue
    @employmentScore = employee/14/5.to_f

    comm = @dandi.commOneValue + @dandi.commTwoValue + @dandi.commThreeValue + @dandi.commFourValue + @dandi.commFiveValue
    @commScore = comm/5/5.to_f

    culture = @dandi.cultureOneValue + @dandi.cultureTwoValue + @dandi.cultureThreeValue + @dandi.cultureFourValue + @dandi.cultureFiveValue + @dandi.cultureSixValue + @dandi.cultureSevenValue + @dandi.cultureEightValue + @dandi.cultureNineValue + @dandi.cultureTenValue + @dandi.cultureElevenValue + @dandi.cultureTwelveValue + @dandi.cultureThirteenValue + @dandi.cultureFourteenValue + @dandi.cultureFifteenValue
    @cultureScore = culture/15/5.to_f

  end

  # GET /diversities/new
  def new
    @questions = Question.all
    @answers = Answer.all
    @diversity = Diversity.new
  end

  # GET /diversities/1/edit
  def edit
  end

  # POST /diversities
  # POST /diversities.json
  def create
    @diversity = Diversity.new(diversity_params)

    respond_to do |format|
      if @diversity.save
        format.html { redirect_to @diversity, notice: 'Diversity was successfully created.' }
        format.json { render :show, status: :created, location: @diversity }
      else
        format.html { render :new }
        format.json { render json: @diversity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diversities/1
  # PATCH/PUT /diversities/1.json
  def update
    respond_to do |format|
      if @diversity.update(diversity_params)
        format.html { redirect_to @diversity, notice: 'Diversity was successfully updated.' }
        format.json { render :show, status: :ok, location: @diversity }
      else
        format.html { render :edit }
        format.json { render json: @diversity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diversities/1
  # DELETE /diversities/1.json
  def destroy
    @diversity.destroy
    respond_to do |format|
      format.html { redirect_to diversities_url, notice: 'Diversity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diversity
      @diversity = Diversity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diversity_params
      params.fetch(:diversity).permit(:diversityOneValue,:diversityTwoValue,:diversityThreeValue, :diversityFourValue, :diversityFiveValue,:diversitySixValue,:diversitySevenValue,:diversityEightValue, :diversityNineValue, :diversityTenValue,

      :employmentOneValue, :employmentTwoValue, :employmentThreeValue, :employmentFourValue, :employmentFiveValue, :employmentSixValue,:employmentSevenValue, :employmentEightValue, :employmentNineValue, :employmentTenValue, :employmentElevenValue, :employmentTwelveValue, :employmentThirteenValue, :employmentFourteenValue,
      :commOneValue, :commTwoValue, :commThreeValue, :commFourValue, :commFiveValue,
      :cultureOneValue, :cultureTwoValue, :cultureThreeValue, :cultureFourValue, :cultureFiveValue, :cultureSixValue,:cultureSevenValue, :cultureEightValue, :cultureNineValue, :cultureTenValue, :cultureElevenValue, :cultureTwelveValue, :cultureThirteenValue, :cultureFourteenValue,:cultureFifteenValue,
      :name, :email)
    end
end
