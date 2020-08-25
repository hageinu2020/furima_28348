class SalesController < ApplicationController
  before_action :move_to_index, except: [:index]

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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :text, :pic, :price, :genre_id, :status_id, :fee_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
