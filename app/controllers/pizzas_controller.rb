class PizzasController < ApplicationController
  before_action :set_pizza, only: [:show, :edit, :update, :destroy]
  before_action :set_toppings, only: [:index, :edit, :update, :destroy]
  before_action :set_doe_kinds, only: [:show, :edit, :update, :destroy]
  before_action :set_images, only: [:show, :edit, :update, :destroy]
  # GET /pizzas
  # GET /pizzas.json
  def index
    @pizzas = Pizza.all
  end

  # GET /pizzas/1
  # GET /pizzas/1.json
  def show
    @toppings = @pizza.toppings.all
    @images = @pizza.images.all
  end

  # GET /pizzas/new
  def new
    @pizza = Pizza.new
    @topping = Topping.all
    @doe_kinds = DoeKind.all
  end

  def add_image
    @pizza = Pizza.find(params[:id])
    Image.create(picture: params[:picture])
    @pizza.image_relationships.create(image_id: Image.last.id)
    redirect_to :back
  end

  # GET /pizzas/1/edit
  def edit
  end

  # POST /pizzas
  # POST /pizzas.json
  def create
    @pizza = Pizza.new(pizza_params)
    respond_to do |format|
      if @pizza.save
        format.html { redirect_to @pizza, notice: 'Pizza was successfully created.' }
        format.json { render :show, status: :created, location: @pizza }
      else
        format.html { render :new }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
    params[:pizza][:topping_ids].each do |topping|
      @pizza.relationships.create(topping_id: topping)
    end
    Image.create(picture: params[:pizza][:picture])
    @pizza.image_relationships.create(image_id: Image.last.id)
  end
  
  # PATCH/PUT /pizzas/1
  # PATCH/PUT /pizzas/1.json
  def update
    respond_to do |format|
      if @pizza.update(pizza_params)
        @pizza.relationships.each do |topping|
         topping.destroy
       end
        params[:pizza][:topping_ids].each do |topping|
         @pizza.relationships.create(topping_id: topping)
        end
        format.html { redirect_to @pizza, notice: 'Pizza was successfully updated.' }
        format.json { render :show, status: :ok, location: @pizza }
      else
        format.html { render :edit }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizzas/1
  # DELETE /pizzas/1.json
  def destroy
    @pizza.destroy
    respond_to do |format|
      format.html { redirect_to pizzas_url, notice: 'Pizza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza
      @pizza = Pizza.find(params[:id])
    end
    
    def set_toppings
      @topping = Topping.all
    end
    
    def set_doe_kinds
      @doe_kinds = DoeKind.all
    end
    def set_images
      @images = @pizza.images.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def pizza_params
      params.require(:pizza).permit(:name, :doe_kind_id)
    end
    
  
end
