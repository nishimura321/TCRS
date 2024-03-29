class AddShowImageToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :show_image, :boolean, default: true, null: false
  end
end
