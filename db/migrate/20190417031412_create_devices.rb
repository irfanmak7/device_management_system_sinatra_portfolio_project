class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :serial_number
      t.string :color
      t.integer :user_id
    end
  end
end
