class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.datetime :event_at
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
