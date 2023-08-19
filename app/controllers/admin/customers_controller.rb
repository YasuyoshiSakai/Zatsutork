class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to admin_customers_path
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to admin_customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:username, :email, :other_attributes)
  end
end
