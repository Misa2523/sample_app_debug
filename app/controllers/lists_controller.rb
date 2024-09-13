class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end

  def edit
    @list = List.find(params[:id])
  end

  def show
    @list = List.find(params[:id])
  end


  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end



  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      @lists = List.all  #「byebugを使ってエラー解決をしてみよう」にて追記したコード
      render :index
    end
  end



  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to list_path(list)  # 投稿一覧画面へリダイレクト
  end

  private

  def list_params
    params.require(:list).permit(:title, :body, :image)
    #paramas：formから送られてくるデータはparamsの中に入っている
    #require：送られてきたデータ中からモデル名(ここでは:list)を指定しデータを絞り込む
    #permit：requireで絞り込んだデータの中から保存を許可するカラムを指定
  end

end
