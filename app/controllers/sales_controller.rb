class SalesController < ApplicationController
  
  def index
    @sales = Sale.all
    @sales = Sales.includes(:sale).order("created_at DESC")
  end
end
