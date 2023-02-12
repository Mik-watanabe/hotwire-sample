class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients
  def index
    # params[:q]には検索フォームで指定した検索条件が入る
    @search = Client.ransack(params[:q])

    # デフォルトのソートをデフォルトのid降順にする
    @search.sorts = "id desc" if @search.sorts.empty?

    # @search.resultで検索結果となる@clientsを取得する
    @clients = @search.result.page(params[:page])
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client, notice: "お客様情報を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: "お客さま情報を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: "お客様情報を削除しました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :age)
    end
end
