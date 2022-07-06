class RegistrarsController < ApplicationController
  before_action :set_registrar, only: %i[ show update destroy ]

  # GET /registrars
  def index
    @registrars = Registrar.all
    data = ActiveModelSerializers::SerializableResource.new(@registrars)
    render json: { success: true, data: data }
  end

  # GET /registrars/1
  def show
    data = ActiveModelSerializers::SerializableResource.new(@registrar)
    render json: { success: true, data: data }
  end

  # POST /registrars
  def create
    @registrar = Registrar.new(registrar_params)

    if @registrar.save
      render json: @registrar, status: :created, location: @registrar
    else
      render json: @registrar.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /registrars/1
  def update
    if @registrar.update(registrar_params)
      render json: @registrar
    else
      render json: @registrar.errors, status: :unprocessable_entity
    end
  end

  # DELETE /registrars/1
  def destroy
    @registrar.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registrar
      @registrar = Registrar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registrar_params
      params.require(:registrar).permit(:first_name, :middle_name, :last_name, :email)
    end
end
