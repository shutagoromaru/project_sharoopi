class TopicsController < ApplicationController
    def new
        render :new
      end
    
      def create
        redirect_to 'topics/new'
      end
    
      def edit
        render :edit
      end
    
      def update
        redirect_to 'topics/edit'
      end
      def create
        redirect_to edit_topics_path # redirects to GET "/posts/new"
      end
end
