class FavoritesController < ApplicationController

    def favorite_create
        @favorite_create = Favorite.new(user_id: current_user.id, post_id: params[:response_id])
        @favorite_create.save
        redirect_to new_response_path(params[:consulting_id]) 
    end

   
end
