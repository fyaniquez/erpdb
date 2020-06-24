class Detalle < ApplicationRecord
  belongs_to :transaccion
  belongs_to :producto
  def precio
    super / DECIMALES
  end
  def cantidad
    super / DECIMALES
  end
  def total
    super / DECIMALES
  end
  def precio=(value)
    super(value.to_i * DECIMALES)
  end
  def cantidad=(value)
    super(value.to_i * DECIMALES)
  end
  def total=(value)
    super( value.to_i * DECIMALES)
  end
end
