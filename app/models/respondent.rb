class Respondent < ApplicationRecord
  validates :organization, presence: { message: "organization can't be blank." }

  validates :user_email, presence: { message: "email can't be blank." }


  has_many :responses
  has_many :questions, through: :responses
end
