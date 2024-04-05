class AddOutdatedColumnToFieldAndAnswer < ActiveRecord::Migration[7.1]
  def change
    add_column :fields, :outdated, :boolean, default: false
    add_column :answers, :outdated, :boolean, default: false
    add_column :answer_fields, :outdated, :boolean, default: false
  end
end
