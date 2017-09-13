class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def all_answers
    @answers = Question.answers
  end

  def respondent_answers
    @respondents = Respondent.user_selection
  end
end
