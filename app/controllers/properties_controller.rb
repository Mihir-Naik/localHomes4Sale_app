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
      redirect_to new_property_path
    end
  end

  def edit
    @property = Property.find(params[:id])
    unless current_user.id == @property.user.id
      redirect_to properties_path, flash: {danger: "Access Denied"}
    end
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to property_path(@property)
    else
      redirect_to edit_property_path(@property)
    end
  end

  def destroy
    @property = Property.find(params[:id])
    if @property.destroy
      redirect_to user_path(@current_user)
    end
  end

  private

  def property_params
    params.require(:property).permit(:price, :address, :sq_footage, :no_of_bedroom, :no_of_bathroom, :description, :image, :image_file)
  end
end
