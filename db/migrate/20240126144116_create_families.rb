class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|

      t.integer "cusutomer_id", null: false
      t.string "last_name", null: false
      t.string "first_name", null: false
      t.string "last_name_kana", null: false
      t.string "first_name_kana", null: false
      t.boolean "male", null: false
      t.integer "relationship", null: false
      t.date "date_of_birth", null: false
      t.string "telephone_number", null: false
      t.string "workplace"
      t.string "workplace_telephone_number"
      t.timestamps
    end
  end
end
