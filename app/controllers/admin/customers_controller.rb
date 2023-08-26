class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @words = @customer.words
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

    if @customer.is_withdrawal
      # 退会処理を実行
      # 例えば、関連データの削除やステータスの更新など
    end

    if @customer.destroy
      flash[:notice] = "ユーザーを削除しました"
    else
      flash[:alert] = "ユーザーの削除に失敗しました"
    end

    redirect_to admin_customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:username, :email, :other_attributes, :is_withdrawal)
  end
end
