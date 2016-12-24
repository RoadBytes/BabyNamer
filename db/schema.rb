# encoding: UTF-8

ActiveRecord::Schema.define(version: 20_161_223_224_728) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'baby_names', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
