class Transaccion < ApplicationRecord
  has_many :detalles, inverse_of: :transaccion, dependent: :destroy
  accepts_nested_attributes_for :detalles, allow_destroy: true
  belongs_to :usuario
  belongs_to :almacen
end
