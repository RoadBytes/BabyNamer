# BabyName controller
class BabyNamesController < ApplicationController
  before_action :set_baby_name, only: [:show, :edit, :update, :destroy]

  # GET /baby_names
  # GET /baby_names.json
  def index
    @baby_names = BabyName.all
  end

  # GET /baby_names/1
  # GET /baby_names/1.json
  def show; end

  # GET /baby_names/new
  def new
    @baby_name = BabyName.new
  end

  # GET /baby_names/1/edit
  def edit; end

  # POST /baby_names
  # POST /baby_names.json
  def create
    @baby_name = BabyName.new(baby_name_params)

    respond_to do |format|
      if @baby_name.save
        format.html do
          redirect_to @baby_name, notice: 'Baby name was successfully created.'
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /baby_names/1
  # PATCH/PUT /baby_names/1.json
  def update
    respond_to do |format|
      if @baby_name.update(baby_name_params)
        format.html do
          redirect_to @baby_name, notice: 'Baby name was successfully updated.'
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /baby_names/1
  # DELETE /baby_names/1.json
  def destroy
    @baby_name.destroy
    respond_to do |format|
      format.html { redirect_to baby_names_url }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_baby_name
    @baby_name = BabyName.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def baby_name_params
    params.require(:baby_name).permit(:name)
  end
end
