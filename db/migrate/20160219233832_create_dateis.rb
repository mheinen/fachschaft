class CreateDateis < ActiveRecord::Migration
  def change
    create_table :dateis do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
