class DoeKindsController < ApplicationController
  before_action :set_doe_kind, only: [:show, :edit, :update, :destroy]

  # GET /doe_kinds
  # GET /doe_kinds.json
  def index
    @doe_kinds = DoeKind.all
  end

  # GET /doe_kinds/1
  # GET /doe_kinds/1.json
  def show
  end

  # GET /doe_kinds/new
  def new
    @doe_kind = DoeKind.new
  end

  # GET /doe_kinds/1/edit
  def edit
  end

  # POST /doe_kinds
  # POST /doe_kinds.json
  def create
    @doe_kind = DoeKind.new(doe_kind_params)

    respond_to do |format|
      if @doe_kind.save
        format.html { redirect_to @doe_kind, notice: 'Doe kind was successfully created.' }
        format.json { render :show, status: :created, location: @doe_kind }
      else
        format.html { render :new }
        format.json { render json: @doe_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doe_kinds/1
  # PATCH/PUT /doe_kinds/1.json
  def update
    respond_to do |format|
      if @doe_kind.update(doe_kind_params)
        format.html { redirect_to @doe_kind, notice: 'Doe kind was successfully updated.' }
        format.json { render :show, status: :ok, location: @doe_kind }
      else
        format.html { render :edit }
        format.json { render json: @doe_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doe_kinds/1
  # DELETE /doe_kinds/1.json
  def destroy
    @doe_kind.destroy
    respond_to do |format|
      format.html { redirect_to doe_kinds_url, notice: 'Doe kind was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doe_kind
      @doe_kind = DoeKind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doe_kind_params
      params.require(:doe_kind).permit(:name)
    end
end
