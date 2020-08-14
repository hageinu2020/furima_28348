class SalesController < ApplicationController
  
  def index
    @sales = Sales.all.order("created_at DESC")
  end
end
