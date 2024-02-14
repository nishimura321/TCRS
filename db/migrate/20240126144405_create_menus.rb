class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|

      t.date "date", null: false
      t.text "school_lunch", null: false
      t.string "snack"
      t.text "ingredient", null: false
      t.timestamps
    end
  end
end
