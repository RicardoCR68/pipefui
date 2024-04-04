class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :form, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
