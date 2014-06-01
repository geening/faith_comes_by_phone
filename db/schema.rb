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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140531235748) do

  create_table "bible_books", force: true do |t|
    t.integer  "language_id",   null: false
    t.integer  "position"
    t.string   "name"
    t.integer  "chapter_count"
    t.string   "dam_id"
    t.string   "external_id"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bible_books", ["external_id"], name: "index_bible_books_on_external_id", unique: true, using: :btree
  add_index "bible_books", ["language_id"], name: "index_bible_books_on_language_id", using: :btree
  add_index "bible_books", ["name"], name: "index_bible_books_on_name", unique: true, using: :btree

  create_table "languages", force: true do |t|
    t.string   "code",                  limit: 3, null: false
    t.string   "default_bible_version"
    t.string   "twilio_phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "languages", ["code"], name: "index_languages_on_code", unique: true, using: :btree
  add_index "languages", ["twilio_phone_number"], name: "index_languages_on_twilio_phone_number", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.integer  "language_id",                null: false
    t.string   "phone_number",    limit: 20, null: false
    t.integer  "bible_book_id"
    t.integer  "current_chapter"
    t.datetime "last_call_at"
    t.datetime "last_sms_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["language_id"], name: "index_users_on_language_id", using: :btree
  add_index "users", ["phone_number"], name: "index_users_on_phone_number", using: :btree

end
