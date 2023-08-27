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
 
 
 
end 

