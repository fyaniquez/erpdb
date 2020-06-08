class Transaccion < ApplicationRecord
  has_many :detalle
  belongs_to :usuario
  belongs_to :almacen
end
