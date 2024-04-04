class CreateAnswerFields < ActiveRecord::Migration[7.1]
  def change
    create_table :answer_fields do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true
      t.string :string_body
      t.text :text_body

      t.timestamps
    end
  end
end
