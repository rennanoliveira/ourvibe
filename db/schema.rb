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

ActiveRecord::Schema.define(:version => 20140529011830) do

  create_table "playlists", :force => true do |t|
    t.string  "name"
    t.string  "code"
    t.string  "password_sha1"
    t.boolean "public"
  end

  create_table "songs", :force => true do |t|
    t.boolean "accepted"
    t.string  "album"
    t.string  "artist"
    t.string  "href"
    t.string  "name"
    t.integer "playlist_id"
  end

end
