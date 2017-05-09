class CreateCounties < ActiveRecord::Migration[5.1]
  def change
    create_table :counties do |t|
      t.string :name, :unique => true
      t.integer :county_code, :unique => true
      t.multi_polygon :geom, :srid => 4326
      #t.timestamps null: false
  end

   change_table :counties do |t|
      t.index :geom, using: :gist
  end
 end
end
