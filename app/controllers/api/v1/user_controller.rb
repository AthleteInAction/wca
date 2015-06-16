module Api
  module V1
  	class UserController < ApplicationController

      before_action :set_user, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = Tools.query params
        
        @users = User.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

        respond_with @users,
        root: :users,
        meta: {
          current_page: @users.current_page,
          next_page: @users.next_page,
          prev_page: @users.prev_page,
          total_pages: @users.total_pages,
          total_count: @users.total_count,
          limit: (params[:limit].to_i || 100).to_i
        }

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @user

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @user.update(user_params)

          render json: @user,status: :ok

        else

          render json: {error: true,errors: @user.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@user = User.new user_params

  			if @user.save

  				render json: @user,status: :created

  			else

  				render json: {error: true,errors: @user.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @user.destroy

          render json: {user: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @user.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit plist
      end

      def plist

        list = :last_active, :login_count, :name, :email, :password, :password_confirmation, :created_at, :updated_at
        list << :access if is_admin?
        
        list

      end

  	end
  end
end