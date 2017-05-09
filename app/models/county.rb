class County < ApplicationRecord
      include Featurable

      featurable :geom, [:name]

end
