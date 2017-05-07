class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :email
      t.string :name
      t.string :phone_number
      t.string :department
      t.string :payment_method
      t.integer :eas_account
      t.string :event_type
      t.string :event_name
      t.integer :reservation_number
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.boolean :multi_day
      t.integer :location_id
      t.integer :wireless_handheld
      t.integer :wireless_lav
      t.integer :wired_handheld
      t.integer :table_stands
      t.integer :floor_stands
      t.boolean :web_conferencing
      t.boolean :press_feed
      t.boolean :third_party
      t.string :third_party_name
      t.boolean :additional_laptops
      t.integer :additional_laptops_count
      t.string :comments

      t.timestamps null: false
    end
  end
end
