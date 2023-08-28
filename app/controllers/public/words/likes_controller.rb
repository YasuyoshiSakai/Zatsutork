<<<<<<< HEAD:app/controllers/public/likes_controller.rb
class Public::LikesController < ApplicationController
=======
class Public::Words::LikesController < ApplicationController
>>>>>>> develop:app/controllers/public/words/likes_controller.rb
  before_action :authenticate_customer! # ログインしているか確認

  def create
    @word = Word.find(params[:word_id])
    like = current_customer.likes.build(word: @word)
    if like.save
      flash[:notice] = "いいねしました"
    else
      flash[:alert] = "いいねに失敗しました"
    end
    redirect_to word_path(@word)
  end

  def destroy
    like = Like.find(params[:id])
    @word = like.word
    if like.destroy
      flash[:notice] = "いいねを取り消しました"
    else
      flash[:alert] = "いいねの取り消しに失敗しました"
    end
    redirect_to word_path(@word)
  end
end
