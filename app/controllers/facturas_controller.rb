class FacturasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_factura, only: [:show, :edit, :update, :destroy]

  #GET /facturas/new
  def new
    @factura = Venta.create(estado: "creando", usuario_id: current_user.id)
    @factura.detalles << Vendido.new(transaccion: @factura)
  end
end
