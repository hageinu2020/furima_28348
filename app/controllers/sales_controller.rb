class SalesController < ApplicationController
  
  def index
    @sales = Sale.all.order("created_at DESC")
  end
end
