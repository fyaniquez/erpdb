class VentasController < ApplicationController
  before_action :set_venta, only: [:show, :edit, :update, :destroy]

  # GET /ventas
  # GET /ventas.json
  def index
    @ventas = Venta.all
  end

  # GET /ventas/1
  # GET /ventas/1.json
  def show
  end

  # GET /ventas/new
  def new
    @venta = Venta.create(estado: "creando", usuario_id: 1)
    #@venta.detalle.build
    #params[:venta_id] = @venta.id.to_s
  end

  # GET /ventas/1/edit
  def edit
    @productos = Producto.all
  end

  # POST /ventas
  # POST /ventas.json
  def create
    @venta = Venta.new(venta_params)
    @venta.usuario_id = 1
    respond_to do |format|
      if @venta.save
        format.html { redirect_to @venta, notice: 'Venta was successfully created.' }
        format.json { render :show, status: :created, location: @venta }
      else
        format.html { render :new }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ventas/1
  # PATCH/PUT /ventas/1.json
  def update
    respond_to do |format|
      if @venta.update(venta_params)
        format.html { redirect_to @venta, notice: 'Venta was successfully updated.' }
        format.json { render :show, status: :ok, location: @venta }
      else
        format.html { render :edit }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ventas/1
  # DELETE /ventas/1.json
  def destroy
    @venta.destroy
    respond_to do |format|
      format.html { redirect_to ventas_url, notice: 'Venta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venta
      @venta = Venta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venta_params
      params.permit!
      params.fetch(:venta, {})
    end

end
