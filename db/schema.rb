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

ActiveRecord::Schema.define(version: 20140610021141) do

  create_table "game_results", force: true do |t|
    t.integer  "game_id"
    t.integer  "home_team_goals"
    t.integer  "visitor_team_goals"
    t.string   "winner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_results", ["game_id"], name: "index_game_results_on_game_id"

  create_table "games", force: true do |t|
    t.integer  "home_team_id"
    t.integer  "visitor_team_id"
    t.datetime "play_at"
    t.integer  "pool_id"
    t.integer  "team_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["home_team_id"], name: "index_games_on_home_team_id"
  add_index "games", ["pool_id"], name: "index_games_on_pool_id"
  add_index "games", ["team_group_id"], name: "index_games_on_team_group_id"
  add_index "games", ["visitor_team_id"], name: "index_games_on_visitor_team_id"

  create_table "leaderboard_histories", force: true do |t|
    t.integer  "user_id"
    t.string   "pool"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leaderboard_histories", ["user_id"], name: "index_leaderboard_histories_on_user_id"

  create_table "pools", force: true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortname"
  end

  create_table "user_predictions", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "home_team_goals"
    t.integer  "visitor_team_goals"
    t.string   "winner"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_predictions", ["game_id"], name: "index_user_predictions_on_game_id"
  add_index "user_predictions", ["user_id"], name: "index_user_predictions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "role",                   default: "user"
    t.boolean  "paid"
    t.boolean  "rules_agreed",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
