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

ActiveRecord::Schema.define(version: 2020_02_20_141537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "product_family"
    t.string "sku"
    t.jsonb "product_attributes", default: {"group"=>"", "location"=>"", "operation"=>"", "usagetype"=>"", "toLocation"=>"", "servicecode"=>"", "servicename"=>"", "fromLocation"=>"", "locationType"=>"", "transferType"=>"", "toLocationType"=>"", "fromLocationType"=>"", "groupDescription"=>""}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sku"], name: "index_products_on_sku"
  end

  create_table "terms", force: :cascade do |t|
    t.string "offer_term_code"
    t.string "sku"
    t.string "effective_date"
    t.jsonb "price_dimensions", default: {"usd"=>"", "unit"=>"", "endRange"=>"", "rateCode"=>"", "beginRange"=>"", "description"=>""}
    t.jsonb "price_details", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sku"], name: "index_terms_on_sku"
  end

end
