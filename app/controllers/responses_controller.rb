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
# section_one
    @section_one = @response.section_one

    total_one = 0
    @section_one.each do |i|
      total_one += i[1].to_i
    end
    @section_one_total = total_one/5

    one = @response.section_one.select{|i| i[1] == "1"}
    @section_one_question_ones = []
    one.each do |i|
      @section_one_question_ones.push(Question.find(i[0]).question_text)
    end

    two = @response.section_one.select{|i| i[1] == "2"}
    @section_one_question_twos = []
    two.each do |i|
      @section_one_question_twos.push(Question.find(i[0]).question_text)
    end


# section_two
    @section_two = @response.section_two

    total_two = 0
    @section_two.each do |i|
      total_two += i[1].to_i
    end
    @section_two_total = total_two/15

    three = @response.section_two.select{|i| i[1] == "1"}
    @section_two_question_ones = []
    three.each do |i|
      @section_two_question_ones.push(Question.find(i[0]).question_text)
    end

    four = @response.section_two.select{|i| i[1] == "2"}
    @section_two_question_twos = []
    four.each do |i|
      @section_two_question_twos.push(Question.find(i[0]).question_text)
    end

# section_three
    @section_three = @response.section_three

    total_three = 0
    @section_three.each do |i|
      total_three += i[1].to_i
    end
    @section_three_total = total_three/6

    five = @response.section_three.select{|i| i[1] == "1"}
    @section_three_question_ones = []
    five.each do |i|
      @section_three_question_ones.push(Question.find(i[0]).question_text)
    end

    six = @response.section_three.select{|i| i[1] == "2"}
    @section_three_question_twos = []
    six.each do |i|
      @section_three_question_twos.push(Question.find(i[0]).question_text)
    end

# section_four
    @section_four = @response.section_four

    total_four = 0
    @section_four.each do |i|
      total_four += i[1].to_i
    end
    @section_four_total = total_four/15

    seven = @response.section_four.select{|i| i[1] == "1"}
    @section_four_question_ones = []
    seven.each do |i|
      @section_four_question_ones.push(Question.find(i[0]).question_text)
    end

    eight = @response.section_four.select{|i| i[1] == "2"}
    @section_four_question_twos = []
    eight.each do |i|
      @section_four_question_twos.push(Question.find(i[0]).question_text)
    end

# section_five
    @section_five = @response.section_five

    total_five = 0
    @section_five.each do |i|
      total_five += i[1].to_i
    end
    @section_five_total = total_five/4

    nine = @response.section_five.select{|i| i[1] == "1"}
    @section_five_question_ones = []
    nine.each do |i|
      @section_five_question_ones.push(Question.find(i[0]).question_text)
    end

    ten = @response.section_five.select{|i| i[1] == "2"}
    @section_five_question_twos = []
    ten.each do |i|
      @section_five_question_twos.push(Question.find(i[0]).question_text)
    end

# section_six
    @section_six = @response.section_six

    total_six = 0
    @section_six.each do |i|
      total_six += i[1].to_i
    end
    @section_six_total = total_six/6

    eleven = @response.section_six.select{|i| i[1] == "1"}
    @section_six_question_ones = []
    eleven.each do |i|
      @section_six_question_ones.push(Question.find(i[0]).question_text)
    end

    twelve = @response.section_six.select{|i| i[1] == "2"}
    @section_six_question_twos = []
    twelve.each do |i|
      @section_six_question_twos.push(Question.find(i[0]).question_text)
    end

# section_seven
    @section_seven = @response.section_seven

    total_seven = 0
    @section_seven.each do |i|
      total_seven += i[1].to_i
    end
    @section_seven_total = total_seven/4

    thirteen = @response.section_seven.select{|i| i[1] == "1"}
    @section_seven_question_ones = []
    thirteen.each do |i|
      @section_seven_question_ones.push(Question.find(i[0]).question_text)
    end

    fourteen = @response.section_seven.select{|i| i[1] == "2"}
    @section_seven_question_twos = []
    fourteen.each do |i|
      @section_seven_question_twos.push(Question.find(i[0]).question_text)
    end


# summary
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



    @onesWeight = []
    groups.each do |i|
      @onesWeight.push(Answer.find(i[0]).answer_weight)
    end

    @average = @onesWeight.inject{ |sum, el| sum + el }.to_f / @onesWeight.size

    @section_one = @response.section_one
    total_one = 0
      @section_one.each do |i|
      total_one += i[1].to_i
      end
    @section_one_total = total_one/5

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

    @response = Response.new(respondent_id: params["respondent_id"], answer_hash: nil, one_hash: nil, two_hash: nil,three_hash: nil, section_one: nil, section_two: nil, section_three: nil, section_four: nil, section_five: nil, section_six: nil, section_seven: nil)

    i = 1
    answer_hash = Hash.new
    55.times do
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
    section_five = Array(answer_hash)[41..44]
    section_six = Array(answer_hash)[45..50]
    section_seven = Array(answer_hash)[51..54]

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
      params.fetch(:response).permit(:section_number, :user_selection, :user_score, :user_selection, :respondent_id, :answer_hash, :section_one, :section_two, :section_three, :section_four, :section_five, :section_six, :section_seven)
    end

end
