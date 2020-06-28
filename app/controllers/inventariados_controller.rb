class InventariadosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventariado, only: [:show, :edit, :update, :destroy]

  # GET /inventariados
  # GET /inventariados.json
  def index
    @inventariados = Inventariado.all
  end

  # GET /inventariados/1
  # GET /inventariados/1.json
  def show
  end

  # GET /inventariados/new
  def new
    @inventariado = Inventariado.new
  end

  # GET /inventariados/1/edit
  def edit
  end

  # POST /inventariados
  # POST /inventariados.json
  def create
    @inventariado = Inventariado.new(inventariado_params)
    respond_to do |format|
      if @inventariado.save
        format.html { redirect_to @inventariado, notice: 'Inventariado was successfully created.' }
        format.json { render :show, status: :created, location: @inventariado }
      else
        format.html { render :new }
        format.json { render json: @inventariado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventariados/1
  # PATCH/PUT /inventariados/1.json
  def update
    respond_to do |format|
      if @inventariado.update(inventariado_params)
        format.html { redirect_to @inventariado, notice: 'Inventariado was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventariado }
      else
        format.html { render :edit }
        format.json { render json: @inventariado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventariados/1
  # DELETE /inventariados/1.json
  def destroy
    @inventariado.destroy
    respond_to do |format|
      format.html { redirect_to inventariados_url, notice: 'Inventariado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventariado
      @inventariado = Inventariado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventariado_params
      params.permit!
      params.fetch(:inventariado, {})
    end

    def unidades_lista
      [["unidad", "u"], ["paquete", "paq."],["litro", "Lt"], ["Botella", "bot"], ["Pieza", "pza"],["sachet", "sach"],["Hojas", "h"], ["Bolivianos", "Bs."]]
    end
end
