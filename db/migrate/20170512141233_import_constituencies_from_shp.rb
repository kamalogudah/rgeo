class ImportConstituenciesFromShp < ActiveRecord::Migration[5.1]
    def up
      from_shp_sql = `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shpfiles', 'KEN_adm2.shp')} constituencies_ref`

      Constituency.transaction do
      execute from_shp_sql

      execute <<-SQL
          insert into constituencies (name, constituency_code, geom) 
            select name_2, ccn_2, geom from constituencies_ref
      SQL

      drop_table :constituencies_ref
    end
  end

  def down
    Constituency.delete_all
  end

 
end
