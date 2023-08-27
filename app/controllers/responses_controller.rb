class ResponsesController < ApplicationController
    def new
        @response = Response.new
        render :new
    end

    def create
        @response = Response.new(response_params)
        @response.user_id =current_user.id  
      if @response.save
       
        redirect_to new_response_path, notice: '登録しました'
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    def edit
        render :edit
    end
    
    def update
        redirect_to 'responses/edit'
    end

    def response_params
        params.require(:response).permit(:title,:content)
    end 
       
end
