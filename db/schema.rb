# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_12_233757) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dices", force: :cascade do |t|
    t.string "code"
    t.integer "max_strikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "piece_productions", force: :cascade do |t|
    t.bigint "dice_id", null: false
    t.integer "number_of_pieces"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "piece_id", null: false
    t.index ["dice_id"], name: "index_piece_productions_on_dice_id"
    t.index ["piece_id"], name: "index_piece_productions_on_piece_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "code"
    t.integer "strikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dice_id", null: false
    t.index ["dice_id"], name: "index_pieces_on_dice_id"
  end

  add_foreign_key "piece_productions", "dices"
  add_foreign_key "piece_productions", "pieces"
  add_foreign_key "pieces", "dices"
end
