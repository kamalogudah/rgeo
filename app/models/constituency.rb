class Constituency < ApplicationRecord
     include Featurable

      featurable :geom, [:name]
end
