class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def edit_prompt
    # 現在のプロンプト内容を取得するなどの処理を行う
  end

  def update_prompt
    # カスタマイズしたプロンプト内容を保存するなどの処理を行う
  end
end