class SalesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :sale_select, except: [:index, :create, :new]

  def index
    @sales = Sale.all.order('created_at DESC')
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sale = Sale.find(params[:id])
    if sale.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.update(sale_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :text, :pic, :price, :genre_id, :status_id, :fee_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def sale_select
    @sale = Sale.find(params[:id])
  end
end
