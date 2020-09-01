class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :buy_select
  def index
    redirect_to root_path if user_signed_in? && current_user.id == @sale.user_id || @sale.buys_date.present?
  end

  def create
    @sale = Sale.find(params[:sale_id])
    @buy = UsersBuy.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.permit(:code, :area_id, :city, :address, :building, :tel, :token, :sale_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @sale[:price], # 商品の値段
      card: buy_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def buy_select
    @sale = Sale.find(params[:sale_id])
  end
end
