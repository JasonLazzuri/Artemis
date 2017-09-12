class DiversityResultsController < ApplicationController
  before_action :set_diversity_result, only: [:show, :edit, :update, :destroy]

  # GET /diversity_results
  # GET /diversity_results.json
  def index
    @diversity_results = DiversityResult.all
    @respondents = Respondent.all
    @total_score = 0


    # @section_one = @response.section_one
    #
    # total_one = 0
    # @section_one.each do |i|
    #   total_one += i[1].to_i
    # end
    # @section_one_total = total_one/5

  end

  # GET /diversity_results/1
  # GET /diversity_results/1.json
  def show
  end

  # GET /diversity_results/new
  def new
    @diversity_result = DiversityResult.new
  end

  # GET /diversity_results/1/edit
  def edit
  end

  # POST /diversity_results
  # POST /diversity_results.json
  def create
    @diversity_result = DiversityResult.new(diversity_result_params)

    respond_to do |format|
      if @diversity_result.save
        format.html { redirect_to @diversity_result, notice: 'Diversity result was successfully created.' }
        format.json { render :show, status: :created, location: @diversity_result }
      else
        format.html { render :new }
        format.json { render json: @diversity_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diversity_results/1
  # PATCH/PUT /diversity_results/1.json
  def update
    respond_to do |format|
      if @diversity_result.update(diversity_result_params)
        format.html { redirect_to @diversity_result, notice: 'Diversity result was successfully updated.' }
        format.json { render :show, status: :ok, location: @diversity_result }
      else
        format.html { render :edit }
        format.json { render json: @diversity_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diversity_results/1
  # DELETE /diversity_results/1.json
  def destroy
    @diversity_result.destroy
    respond_to do |format|
      format.html { redirect_to diversity_results_url, notice: 'Diversity result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diversity_result
      @diversity_result = DiversityResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diversity_result_params
      params.fetch(:diversity_result, {})
    end
end
