class ImportCountriesFromShp < ActiveRecord::Migration[5.1]
  def up
    from_shp_sql = `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shpfiles', 'KEN_adm0.shp')} countries_ref`

    Country.transaction do
      execute from_shp_sql

      execute <<-SQL
          insert into countries(name, iso_code, geom) 
            select name_engli, iso, geom from countries_ref
      SQL

      drop_table :countries_ref
    end

  end

  def down
    Country.delete_all
  end

end
