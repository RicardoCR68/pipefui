class UniteFieldLabelsInOneColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :fields, :label, :string

    remove_column :fields, :text_label
    remove_column :fields, :string_label
  end
end
