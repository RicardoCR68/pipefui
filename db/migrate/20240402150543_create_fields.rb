# frozen_string_literal: true

class CreateFields < ActiveRecord::Migration[7.1]
  def change
    create_table :fields do |t|
      t.references :form, null: false, foreign_key: true
      t.string :kind
      t.text :text_body
      t.string :string_body

      t.timestamps
    end
  end
end
