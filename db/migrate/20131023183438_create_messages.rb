class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :schoolid
      t.string :theme
      t.text :message

      t.timestamps
    end
  end
end
