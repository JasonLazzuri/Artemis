# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170911175801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_questions", id: false, force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "question_id", null: false
    t.index ["answer_id", "question_id"], name: "index_answer_questions_on_answer_id_and_question_id"
    t.index ["question_id", "answer_id"], name: "index_answer_questions_on_question_id_and_answer_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "answer_text"
    t.integer "answer_weight"
  end

  create_table "assessments", force: :cascade do |t|
    t.integer "remoteOneValue"
    t.integer "remoteTwoValue"
    t.integer "remoteThreeValue"
    t.integer "remoteFourValue"
    t.integer "remoteFiveValue"
    t.integer "strategyOneValue"
    t.integer "strategyTwoValue"
    t.integer "strategyThreeValue"
    t.integer "strategyFourValue"
    t.integer "strategyFiveValue"
    t.integer "strategySixValue"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diversities", force: :cascade do |t|
    t.integer "diversityOneValue"
    t.integer "diversityTwoValue"
    t.integer "diversityThreeValue"
    t.integer "diversityFourValue"
    t.integer "diversityFiveValue"
    t.integer "diversitySixValue"
    t.integer "diversitySevenValue"
    t.integer "diversityEightValue"
    t.integer "diversityNineValue"
    t.integer "diversityTenValue"
    t.integer "employmentOneValue"
    t.integer "employmentTwoValue"
    t.integer "employmentThreeValue"
    t.integer "employmentFourValue"
    t.integer "employmentFiveValue"
    t.integer "employmentSixValue"
    t.integer "employmentSevenValue"
    t.integer "employmentEightValue"
    t.integer "employmentNineValue"
    t.integer "employmentTenValue"
    t.integer "employmentElevenValue"
    t.integer "employmentTwelveValue"
    t.integer "employmentThirteenValue"
    t.integer "employmentFourteenValue"
    t.integer "commOneValue"
    t.integer "commTwoValue"
    t.integer "commThreeValue"
    t.integer "commFourValue"
    t.integer "commFiveValue"
    t.integer "cultureOneValue"
    t.integer "cultureTwoValue"
    t.integer "cultureThreeValue"
    t.integer "cultureFourValue"
    t.integer "cultureFiveValue"
    t.integer "cultureSixValue"
    t.integer "cultureSevenValue"
    t.integer "cultureEightValue"
    t.integer "cultureNineValue"
    t.integer "cultureTenValue"
    t.integer "cultureElevenValue"
    t.integer "cultureTwelveValue"
    t.integer "cultureThirteenValue"
    t.integer "cultureFourteenValue"
    t.integer "cultureFifteenValue"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "section_number"
    t.string "question_text"
  end

  create_table "respondents", force: :cascade do |t|
    t.string "user_email"
    t.string "user_name"
    t.string "organization"
    t.integer "section_one_score"
    t.integer "section_two_score"
    t.integer "section_three_score"
    t.integer "section_four_score"
    t.integer "section_five_score"
    t.integer "section_six_score"
    t.integer "section_seven_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "respondent_id"
    t.string "user_selection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "answer_hash"
    t.text "one_hash"
    t.text "two_hash"
    t.text "three_hash"
    t.text "section_one", default: [], array: true
    t.text "section_two", default: [], array: true
    t.text "section_three", default: [], array: true
    t.text "section_four", default: [], array: true
    t.text "section_five", default: [], array: true
    t.text "section_six", default: [], array: true
    t.text "section_seven", default: [], array: true
    t.index ["respondent_id"], name: "index_responses_on_respondent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.integer "section_score"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "responses", "respondents"
end
