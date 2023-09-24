class ConsultingsController < ApplicationController
    before_action :set_consulting, only: [:edit, :update]
  
  
  def index
    # #@title = params[:title]
    # #if @title.present?
    #   @consulting = Consulting.where('title LIKE ?', "%#{@title}%")
    # else
    #   @consulting = Consulting.all
    # end
    @consultings=Consulting.order("id desc").limit(3)
    render :index
  end
  
  def list
    @consultings=Consulting.order("id desc")
    render :list
  end

  
 def new
   @consulting = Consulting.new
   render :new
 end

 def create
     @consulting = Consulting.new(consulting_params)
     @consulting.user_id =current_user.id  
   if @consulting.save
    
     redirect_to new_consulting_path, notice: '登録しました'
   else
     render :new, status: :unprocessable_entity
   end
 end 

 def show
  @consulting = Consulting.find(params[:consulting_id])
  # @consulting = Consulting.preload(responses: :favorites)
  #          .joins(responses: :favorites)
  #          .where(id: params[:consulting_id])
  #          .where(favorites: { user_id: current_user.id })
  #          .first
  @response = Response.new
  
  render :show
end

def create_response
  @response = Response.new(response_params)
  @response.consulting_id=params[:consulting_id]
  @response.user_id=current_user.id
  if @response.save
    redirect_to new_response_path(params[:consulting_id]), notice: '回答しました'
  else
    # 失敗した場合には app/views/posts/show.html.erb で必要な変数を取得します
    @consulting = Consulting.find(params[:consulting_id])
    @responses = Response.where(consulting_id: params[:consulting_id])
    render :show, status: :unprocessable_entity
  end
end


 def edit
    @consulting = Consulting.find(params[:id])
    
    render :edit
 end

 def update
   @consulting = Consulting.find(params[:id])
    if params[:consulting]
      @consulting.attach(params[:consulting])
    end
    if @consulting.update(consulting_params)
      redirect_to index_consulting_path, notice: '更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
 end 
 
 
  def destroy
    @consulting = Consulting.find(params[:id])
    @consulting.destroy
    redirect_to index_consulting_path, notice: '削除しました'
  end


  private

 def set_consulting
   @consulting=Consulting.find(params[:id])
 end 

 def consulting_params
  params.require(:consulting).permit(:title,:content)
 end 
 
def response_params
  params.require(:response).permit(:content,:title)
end

 
end 

