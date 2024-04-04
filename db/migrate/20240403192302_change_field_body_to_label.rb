class ChangeFieldBodyToLabel < ActiveRecord::Migration[7.1]
  def change
    rename_column :fields, :text_body, :text_label
    rename_column :fields, :string_body, :string_label
  end
end
