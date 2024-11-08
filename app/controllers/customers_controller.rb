class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def order_alphabetized
    @customers = Customer.order(:full_name)
  end
end
