ActiveRecord::Schema.define(version: 20171023201725) do

  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
