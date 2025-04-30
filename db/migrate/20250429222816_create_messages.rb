class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.text :prompt
      t.text :answer

      t.timestamps
    end
  end
end
