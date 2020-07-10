class FacturasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_factura, only: [:show, :edit, :update, :destroy]

  #GET /facturas/new
  def new
    @factura = Venta.create(estado: "creando", usuario_id: current_user.id, almacen_id: 3, fecha: Date.today)
    @vendido = Vendido.new(transaccion: @factura)
    @productos = productos_lista
  end
  private
  def productos_lista
    Producto.order(:nombre).collect {|p| [p.nombre, {precio: p.precio}, p.id]}
  end  
  def factura_params
    params.require(:venta).permit(:objeto, vendido: [:producto_id, :precio, :cantidad, :total])
  end
end
