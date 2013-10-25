class AddZipToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :zip, :integer
  end
end
