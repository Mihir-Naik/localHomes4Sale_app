class ImagesController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @images = Image.all
    @property = Property.find(params[:property_id])
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
    @property = Property.find(params[:property_id])
    unless current_user.id == @property.user.id
      redirect_to property_path(@property), flash: {danger: "Access Denied"}
    end
  end

  def create
    @property = Property.find(params[:property_id])
    unless current_user.id == @property.user.id
      redirect_to properties_path, flash: {danger: "Access Denied"}
    end
    @image = @property.images.new(image_params)
    if @image.save
      redirect_to property_path(@property)
    else
      redirect_to new_image_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      redirect_to property_images_path
    end
  end

  private
  def image_params
    params.require(:image).permit(:caption, :picture)
  end
end
