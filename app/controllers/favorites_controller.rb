class FavoritesController < ApplicationController

    def favorite_create
        @favorite_create = Favorite.new(user_id: current_user.id, response_id: params[:response_id])
        @favorite_create.save
        redirect_to new_response_path(params[:consulting_id]), notice: 'いいねしました。'
    end

    def favorite_delete
        @post_favorite = Favorite.find_by(user_id: current_user.id, response_id: params[:response_id])
        @post_favorite.destroy
        redirect_to new_response_path(params[:consulting_id]), notice: 'いいねを取り消しました。'
    end
      
   
end
