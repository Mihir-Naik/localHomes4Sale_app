class PropertiesController < ApplicationController

  before_action :authorize, except: [:index, :show]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def show
    @property = Property.find(params[:id])
  end

  def create
    @property = current_user.properties.new(property_params)
    if @property.save
      redirect_to user_path(@current_user)
    else
      redirect to new_property_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def property_params
    params.require(:property).permit(:price, :address, :sq_footage, :no_of_bedroom, :no_of_bathroom, :description, :image)
  end
end
