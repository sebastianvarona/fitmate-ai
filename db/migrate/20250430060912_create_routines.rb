class CreateRoutines < ActiveRecord::Migration[7.2]
  def change
    create_table :routines do |t|
      t.string :title
      t.text :content
      t.json :weekdays

      t.timestamps
    end
  end
end
