class CreateProgresses < ActiveRecord::Migration[7.2]
    def change
      create_table :progresses do |t|
        t.references :user, null: false, foreign_key: true
        t.date :recorded_on, null: false
        t.float :weight
        t.float :waist
        t.float :hips
        t.float :chest
        t.string :photo_url
  
        t.timestamps
      end
    end
  end