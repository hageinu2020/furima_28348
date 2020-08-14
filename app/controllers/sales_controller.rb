class SalesController < ApplicationController
  
  def index
    @sales = Sale.all
    @sales = Sales.all.order("created_at DESC")
  end
end
