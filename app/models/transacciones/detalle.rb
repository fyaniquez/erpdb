class Detalle < ApplicationRecord
  belongs_to :transaccion
  belongs_to :producto
end
