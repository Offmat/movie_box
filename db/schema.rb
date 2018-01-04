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

ActiveRecord::Schema.define(version: 20180103192217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "surname"], name: "index_directors_on_name_and_surname", unique: true
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.date "release_date"
    t.text "info"
    t.text "genres", default: [], array: true
    t.text "countries", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "duration"
  end

  create_table "movies_directors", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "director_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_movies_directors_on_director_id"
    t.index ["movie_id", "director_id"], name: "index_movies_directors_on_movie_id_and_director_id", unique: true
    t.index ["movie_id"], name: "index_movies_directors_on_movie_id"
  end

  create_table "movies_writers", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "writer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id", "writer_id"], name: "index_movies_writers_on_movie_id_and_writer_id", unique: true
    t.index ["movie_id"], name: "index_movies_writers_on_movie_id"
    t.index ["writer_id"], name: "index_movies_writers_on_writer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_hash", null: false
    t.string "password_salt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "writers", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "surname"], name: "index_writers_on_name_and_surname", unique: true
  end

  add_foreign_key "movies_directors", "directors"
  add_foreign_key "movies_directors", "movies"
  add_foreign_key "movies_writers", "movies"
  add_foreign_key "movies_writers", "writers"
end
