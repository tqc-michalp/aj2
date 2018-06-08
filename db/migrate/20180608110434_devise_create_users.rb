# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :articles_count
      t.string :email, null: true, default: 'email@example.com'
      t.string :encrypted_password, null: true, default: 'password'
      t.boolean :admin, default: false

      t.timestamps null: false
    end
    add_index :users, :email, unique: false
  end
end
