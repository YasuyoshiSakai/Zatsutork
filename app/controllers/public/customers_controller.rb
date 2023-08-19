class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @words = @customer.words
  end

  def need
  end
end