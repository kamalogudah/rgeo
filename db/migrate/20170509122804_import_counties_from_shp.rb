class ImportCountiesFromShp < ActiveRecord::Migration[5.1]
    def up
      from_shp_sql = `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shpfiles', 'KEN_adm1.shp')} counties_ref`

      County.transaction do
      execute from_shp_sql

      execute <<-SQL
          insert into counties(name, county_code, geom) 
            select name_1, ccn_1, geom from counties_ref
      SQL

      drop_table :counties_ref
    end
  end

  def down
    County.delete_all
  end

end
