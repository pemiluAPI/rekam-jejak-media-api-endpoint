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

ActiveRecord::Schema.define(version: 20150917233028) do

  create_table "paslons", force: true do |t|
    t.string   "nama_calon"
    t.string   "nama_wakil_calon"
    t.text     "qwords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rekam_jejaks", force: true do |t|
    t.integer  "paslon_id"
    t.integer  "sumber_media_id"
    t.string   "link"
    t.text     "judul"
    t.text     "content_media"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sumber_media", force: true do |t|
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
