class CreateConstituencies < ActiveRecord::Migration[5.1]
  def change
    create_table :constituencies do |t|
      t.string :name, :unique => true
      t.integer :constituency_code, :unique => true
      t.multi_polygon :geom, :srid => 4326
     
    end
    change_table :constituencies do |t|
      t.index :geom, using: :gist
   end
  end
end
