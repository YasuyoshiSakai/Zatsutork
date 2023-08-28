class Admin::WordCommentsController < ApplicationController
  before_action :authenticate_admin! # 管理者ログインが必要なアクションに適用

  def destroy
    @comment = WordComment.find(params[:id])
    @comment.destroy
    redirect_to admin_word_path(@comment.word), notice: "コメントが削除されました。"
  end
end

