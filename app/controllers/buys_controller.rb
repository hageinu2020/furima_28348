class BuysController < ApplicationController
  before_action :authenticate_user!
  def index
    @sale = Sale.find(params[:sale_id])
    redirect_to root_path if user_signed_in? && current_user.id == @sale.user_id || @sale.buys_date.present?
  end

  def create
    @sale = Sale.find(params[:sale_id])
    # @user = User.find(params[:user_id])
    @buy = UsersBuy.new(buy_params)
    # binding.pry
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
    Payjp.api_key = 'sk_test_526b279e55f52726c1cd8752' # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @sale[:price], # 商品の値段
      card: buy_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
