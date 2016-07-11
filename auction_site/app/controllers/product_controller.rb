class ProductController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = User.find(params[:id])
    @product = @user.products.new(product_params)
    @product.save

    redirect_to("user/#{@user.id}/product/#{@product.id}")
  end

  def destroy
  end

  def new
    @user = User.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :deadline, :user_id)
  end

end
