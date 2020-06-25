class Detalle < ApplicationRecord
  belongs_to :transaccion
  belongs_to :producto
  def precio
    super.to_f / DECIMALES
  end
  def cantidad
    super.to_f / DECIMALES
  end
  def total
    super.to_f / DECIMALES
  end
  def precio=(value)
    super(value.to_f * DECIMALES)
  end
  def cantidad=(value)
    super(value.to_f * DECIMALES)
  end
  def total=(value)
    super( value.to_f * DECIMALES)
  end
end
