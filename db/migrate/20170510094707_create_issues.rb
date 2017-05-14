class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.st_point :coords, :srid => 4326

      
    end
    change_table :issues do |t|
      t.index :coords, using: :gist
  end
  end
end
