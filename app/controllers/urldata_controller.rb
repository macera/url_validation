class UrldataController < ApplicationController
  before_action :set_urldatum, only: [:show, :edit, :update, :destroy]

  # GET /urldata
  # GET /urldata.json
  def index
    @urldata = Urldatum.all
  end

  # GET /urldata/1
  # GET /urldata/1.json
  def show
  end

  # GET /urldata/new
  def new
    @urldatum = Urldatum.new
  end

  # GET /urldata/1/edit
  def edit
  end

  # POST /urldata
  # POST /urldata.json
  def create
    @urldatum = Urldatum.new(urldatum_params)

    respond_to do |format|
      if @urldatum.save
        format.html { redirect_to @urldatum, notice: 'Urldatum was successfully created.' }
        format.json { render :show, status: :created, location: @urldatum }
      else
        format.html { render :new }
        format.json { render json: @urldatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urldata/1
  # PATCH/PUT /urldata/1.json
  def update
    respond_to do |format|
      if @urldatum.update(urldatum_params)
        format.html { redirect_to @urldatum, notice: 'Urldatum was successfully updated.' }
        format.json { render :show, status: :ok, location: @urldatum }
      else
        format.html { render :edit }
        format.json { render json: @urldatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urldata/1
  # DELETE /urldata/1.json
  def destroy
    @urldatum.destroy
    respond_to do |format|
      format.html { redirect_to urldata_url, notice: 'Urldatum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urldatum
      @urldatum = Urldatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urldatum_params
      params.require(:urldatum).permit(:url, :text)
    end
end
