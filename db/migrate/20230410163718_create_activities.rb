class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.time :start_time
      t.time :end_time
      t.date :date
      t.timestamps
    end
  end
end
