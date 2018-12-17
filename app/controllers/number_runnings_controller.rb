class NumberRunningsController < ApplicationController
  before_action :set_number_running, only: [:show, :edit, :update, :destroy]

  # GET /number_runnings
  # GET /number_runnings.json
  def index
    @number_runnings = NumberRunning.all
  end

  # GET /number_runnings/1
  # GET /number_runnings/1.json
  def show
  end

  # GET /number_runnings/new
  def new
    @number_running = NumberRunning.new
  end

  # GET /number_runnings/1/edit
  def edit
  end

  # POST /number_runnings
  # POST /number_runnings.json
  def create
    @number_running = NumberRunning.new(number_running_params)

    respond_to do |format|
      if @number_running.save
        format.html { redirect_to @number_running, notice: 'Number running was successfully created.' }
        format.json { render :show, status: :created, location: @number_running }
      else
        format.html { render :new }
        format.json { render json: @number_running.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /number_runnings/1
  # PATCH/PUT /number_runnings/1.json
  def update
    respond_to do |format|
      if @number_running.update(number_running_params)
        format.html { redirect_to @number_running, notice: 'Number running was successfully updated.' }
        format.json { render :show, status: :ok, location: @number_running }
      else
        format.html { render :edit }
        format.json { render json: @number_running.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /number_runnings/1
  # DELETE /number_runnings/1.json
  def destroy
    @number_running.destroy
    respond_to do |format|
      format.html { redirect_to number_runnings_url, notice: 'Number running was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number_running
      @number_running = NumberRunning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_running_params
      params.require(:number_running).permit(:title, :body)
    end
end
