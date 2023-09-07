class UserProfilesController < ApplicationController
    def show
        
        @user_profile =UserProfile.find_by(user_id: params[:user_id])
        @me=current_user
        render :show
    end

    def edit
        user=current_user
        @user_profile =UserProfile.find_by(user_id: user.id)
        if @user_profile==nil
            @user_profile=UserProfile.new
        end
        render :edit
    end

    def update
        user = current_user
        @user_profile = UserProfile.find_by(user_id: user.id)

            if @user_profile
             # プロフィールレコードが既に存在する場合、更新処理を行う
                if @user_profile.update(user_profile_params)
            redirect_to show_user_profile_path, notice: 'プロフィールが更新されました'
                else
            render :edit, alert: 'プロフィールの更新に失敗しました'
                end
            else
            # プロフィールレコードが存在しない場合、新規作成を行う
             @user_profile = UserProfile.new(user_profile_params)
            user_profile.user_id = user.id


                if @user_profile.save
                redirect_to show_user_profile_path, notice: 'プロフィールが登録されました'
                else
                render :edit, alert: 'プロフィールの登録に失敗しました'
                end
            end
    end
    
    private
    def user_profile_params
      params.require(:user_profile).permit(:name, :url, :self_introduction, :special) # ここで許可するフィールドを列挙
    end

