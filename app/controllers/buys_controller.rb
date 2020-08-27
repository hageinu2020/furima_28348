class BuysController < ApplicationController

  def index
    @sale = Sale.find(params[:sale_id])
  end

end
