module Api
  module V1
  	class CommentController < ApplicationController

      before_action :set_comment, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = Tools.query params
        
        @comments = Comment.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

        respond_with @comments,
        root: :comments,
        meta: {
          current_page: @comments.current_page,
          next_page: @comments.next_page,
          prev_page: @comments.prev_page,
          total_pages: @comments.total_pages,
          total_count: @comments.total_count,
          limit: (params[:limit].to_i || 100).to_i
        }

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @comment

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @comment.update(comment_params)

          render json: @comment,status: :ok

        else

          render json: {error: true,errors: @comment.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@comment = Comment.new comment_params

        @comment.user_id = current_user.id

  			if @comment.save

  				render json: @comment,status: :created

  			else

  				render json: {error: true,errors: @comment.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @comment.destroy

          render json: {comment: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @comment.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def comment_params
        params.require(:comment).permit plist
      end

      def plist
        [:user_id,:body,:section,:created_at, :updated_at]
      end

  	end
  end
end