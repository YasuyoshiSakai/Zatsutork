class Public::WordCommentsController < ApplicationController
  before_action :authenticate_customer! # ログインが必要なアクションに適用

  def create
    word = Word.find(params[:word_id]) 
    comment = current_customer.word_comments.new(word_comment_params)
    comment.word_id = word.id
    comment.save
    redirect_to request.referer
  end


  def destroy
    @comment = Comment.find(params[:id])
    if current_customer.admin? || current_customer == @comment.customer
      @comment.destroy
      redirect_to @comment.word, notice: "コメントが削除されました。"
    else
      redirect_to @comment.word, alert: "コメントの削除権限がありません。"
    end
  end

  private

  def word_comment_params
    params.require(:word_comment).permit(:comment)
  end

end
