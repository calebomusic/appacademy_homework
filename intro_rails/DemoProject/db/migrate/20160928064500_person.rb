class Person < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.text :house_id

      t.timestamps
    end
  end
end
