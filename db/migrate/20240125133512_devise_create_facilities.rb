# frozen_string_literal: true

class DeviseCreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      t.string "name", null: false
      t.string "name_kana", null: false
      t.string "postal_code", null: false
      t.string "address", null: false
      t.string "telephone_number", null: false
      t.string "website", null: false
      t.string "business_day", null: false
      t.string "business_hours", null: false
      t.string "inquiry_hours", null: false
      t.string "closed_day", null: false
      t.string "childcare_hours", null: false
      t.string "target_age", null: false
      t.string "school_meal", null: false
      t.string "fee", null: false
      t.text "message", null: false
      t.boolean "is_active", default: true, null: false

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :facilities, :email,                unique: true
    add_index :facilities, :reset_password_token, unique: true
    # add_index :facilities, :confirmation_token,   unique: true
    # add_index :facilities, :unlock_token,         unique: true
  end
end
