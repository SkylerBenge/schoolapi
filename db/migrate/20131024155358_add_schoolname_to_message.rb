class AddSchoolnameToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :schoolname, :string
  end
end
