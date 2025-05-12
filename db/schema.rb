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

ActiveRecord::Schema[7.1].define(version: 2025_05_12_200949) do
  create_table "leads", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.decimal "monthly_sales"
    t.decimal "requested_amount"
    t.boolean "sms_consent"
    t.boolean "sms_opt_in"
    t.string "business_name"
    t.string "year_in_business"
    t.string "business_classification"
    t.string "ein"
    t.boolean "home_based"
    t.string "industry"
    t.string "website"
    t.string "utm_browser"
    t.string "utm_device_type"
    t.string "utm_os"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
