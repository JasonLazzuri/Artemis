class Response < ApplicationRecord
  belongs_to :respondent
  
  serialize :answer_hash
end
