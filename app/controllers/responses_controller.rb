class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show

    to = @response.one_hash
    to.delete! '\\"" {}'
    to.gsub!(/=>/,',')
    split = to.split(",")
    array = eval split.to_s.gsub('"', '')
    groups = array.in_groups_of(2)

    @ones = []
    groups.each do |i|
      @ones.push(Question.find(i[0]).question_text)
    end

  end

  # GET /responses/new
  def new
    @response = Response.new
    @question = Question.all
    @answers = Answer.all
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @question = Question.all

    @response = Response.new(respondent_id: params["respondent_id"], answer_hash: nil, one_hash: nil, two_hash: nil,three_hash: nil, section_one: nil, section_two: nil,section_three: nil,section_four: nil,section_five: nil,section_six: nil,section_seven: nil)

    i = 1
    answer_hash = Hash.new
    41.times do
      answer_hash[i.to_s] = params["question_id " + i.to_s]
      i += 1
    end


    one_hash = answer_hash.select {|k,v|v == "1"}
    two_hash = answer_hash.select {|k,v|v == "2"}
    three_hash = answer_hash.select {|k,v|v == "3"}

    section_one = Array(answer_hash)[0..4]
    section_two = Array(answer_hash)[5..19]
    section_three = Array(answer_hash)[20..25]
    section_four = Array(answer_hash)[26..40]
    section_five = Array(answer_hash)[0..4]
    section_six = Array(answer_hash)[0..4]
    section_seven = Array(answer_hash)[0..4]

    @response.update(answer_hash: answer_hash, one_hash: one_hash, two_hash: two_hash, three_hash: three_hash, section_one: section_one, section_two: section_two, section_three: section_three, section_four: section_four, section_five: section_five, section_six: section_six, section_seven: section_seven)
    @response.save

    respond_to do |format|
      if @response.save
        format.html { redirect_to respondent_response_url(:id => @response.id), notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end

  end


  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.fetch(:response).permit(:section_number, :user_selection, :user_score, :user_selection, :respondent_id, :answer_hash, :section_one)
    end

end
