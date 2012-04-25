# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120424223756) do

  create_table "answer_options", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "choice"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answer_options", ["question_id"], :name => "index_answer_options_on_question_id"

  create_table "answers", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "choice"
    t.integer  "question_id"
    t.integer  "course_id"
    t.integer  "answer_option_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "answers", ["answer_option_id"], :name => "index_answers_on_answer_option_id"
  add_index "answers", ["course_id"], :name => "index_answers_on_course_id"
  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "question_id"
    t.integer  "course_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comments", ["course_id"], :name => "index_comments_on_course_id"
  add_index "comments", ["question_id"], :name => "index_comments_on_question_id"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "active"
  end

  add_index "questions", ["course_id"], :name => "index_questions_on_course_id"

  create_table "shorts", :force => true do |t|
    t.string   "uri"
    t.string   "shortener"
    t.integer  "clicks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.boolean  "administrator"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
