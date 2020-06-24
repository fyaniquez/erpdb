class VendidosController < ApplicationController
  before_action :set_vendido, only: [:show, :edit, :update, :destroy]

  # GET /vendidos
  # GET /vendidos.json
  def index
    @vendidos = Vendido.all
  end

  # GET /vendidos/1
  # GET /vendidos/1.json
  def show
  end

  # GET /vendidos/new
  def new
    @vendido = Vendido.new
    @productos = productos_lista
  end

  # GET /vendidos/1/edit
  def edit
    @productos = productos_lista
  end

  # POST /vendidos
  # POST /vendidos.json
  def create
    @vendido = Vendido.new(vendido_params)
    respond_to do |format|
      if @vendido.save
        format.html { redirect_to @vendido, notice: 'Vendido was successfully created.' }
        format.json { render :show, status: :created, location: @vendido }
      else
        format.html { render :new }
        format.json { render json: @vendido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendidos/1
  # PATCH/PUT /vendidos/1.json
  def update
    respond_to do |format|
      if @vendido.update(vendido_params)
        format.html { redirect_to @vendido, notice: 'Vendido was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendido }
      else
        format.html { render :edit }
        format.json { render json: @vendido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendidos/1
  # DELETE /vendidos/1.json
  def destroy
    @vendido.destroy
    respond_to do |format|
      format.html { redirect_to vendidos_url, notice: 'Vendido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendido
      @vendido = Vendido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendido_params
      params.permit!
      params.fetch(:vendido, {})
    end

    def unidades_lista
      [["unidad", "u"], ["paquete", "paq."],["litro", "Lt"], ["Botella", "bot"], ["Pieza", "pza"],["sachet", "sach"],["Hojas", "h"], ["Bolivianos", "Bs."]]
    end

    def productos_lista
      Producto.order(:nombre).collect {|p| [p.nombre, {precio: p.precio}, p.id]}
    end
end
