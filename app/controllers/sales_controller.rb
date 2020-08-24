class SalesController < ApplicationController
  before_action :move_to_index, except:[:index]

  def index
    @sales = Sale.all.order('created_at DESC')
  end

  def new
    @sale = Sale.new
  end

  def create
    #binding.pry
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
  def sale_params
    params.permit(:name, :text, :pic, :price, :genre_id, :status_id, :fee_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
