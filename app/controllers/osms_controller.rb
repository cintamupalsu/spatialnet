class OsmsController < ApplicationController
  before_action :set_osm, only: [:show, :edit, :update, :destroy]

  # GET /osms
  # GET /osms.json
  def index
    @osms = Osm.all
    @osm= Osm.new
  end

  # GET /osms/1
  # GET /osms/1.json
  def show
  end

  # GET /osms/new
  def new
    @osm = Osm.new
  end

  # GET /osms/1/edit
  def edit
  end

  # POST /osms
  # POST /osms.json
  def create
    @osm = Osm.new(osm_params)

    respond_to do |format|
      if @osm.save
        format.html { redirect_to @osm, notice: 'Osm was successfully created.' }
        format.json { render :show, status: :created, location: @osm }
      else
        format.html { render :new }
        format.json { render json: @osm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /osms/1
  # PATCH/PUT /osms/1.json
  def update
    respond_to do |format|
      if @osm.update(osm_params)
        format.html { redirect_to @osm, notice: 'Osm was successfully updated.' }
        format.json { render :show, status: :ok, location: @osm }
      else
        format.html { render :edit }
        format.json { render json: @osm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /osms/1
  # DELETE /osms/1.json
  def destroy
    @osm.destroy
    respond_to do |format|
      format.html { redirect_to osms_url, notice: 'Osm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_osm
      @osm = Osm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def osm_params
      params.require(:osm).permit(:custom01, :custom02, :custom03, :custom04, :custom05, :custom06)
    end
end
