class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :title
      t.string :freebie
      t.text :description
      t.date :event_date
      t.string :event_time
      t.text :affiliation
    end
  end

  def down
    drop_table :events
  end
end
