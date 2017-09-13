class RespondentsController < ApplicationController
  before_action :set_respondent, only: [:show, :edit, :update, :destroy]

  def index
    @respondents = Respondent.all
  end


  def new
    @respondent = Respondent.new
  end


  def create
    @respondent = Respondent.new(respondent_params)
    if @respondent.save
      redirect_to new_respondent_response_path(@respondent);
    else
      render :new;
    end
  end


  def update
    respond_to do |format|
      if @respondent.update(respondent_params)
        format.html { redirect_to @respondent, notice: 'Respondent was successfully updated.' }
        format.json { render :show, status: :ok, location: @respondent }
      else
        format.html { render :edit }
        format.json { render json: @respondent.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @respondent.destroy
    respond_to do |format|
      format.html { redirect_to respondents_url, notice: 'Respondent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_respondent
      @respondent = Respondent.find(params[:id])
    end

    def respondent_params
      params.fetch(:respondent).permit(:user_name, :user_email, :organization)
    end
end
