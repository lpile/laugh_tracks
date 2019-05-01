class CreateSpecials < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.string :name
      t.integer :running_time
      t.integer :comedian_id

      t.timestamps
    end
  end
end
