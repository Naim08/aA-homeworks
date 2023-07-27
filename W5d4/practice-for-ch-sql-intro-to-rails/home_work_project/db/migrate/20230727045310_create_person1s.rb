class CreatePerson1s < ActiveRecord::Migration[7.0]
  def change
    create_table :person1s do |t|
      t.string :name
      t.integer :house_id

      t.timestamps
    end
  end
end
