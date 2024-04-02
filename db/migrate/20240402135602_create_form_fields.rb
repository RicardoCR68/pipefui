class CreateFormFields < ActiveRecord::Migration[7.1]
  def change
    create_table :text_fields do |t|
      t.text :body
      t.belongs_to :form

      t.timestamps
    end

    create_table :string_fields do |t|
      t.string :body
      t.belongs_to :form

      t.timestamps
    end
  end
end
