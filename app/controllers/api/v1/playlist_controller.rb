module Api
  module V1
  	class PlaylistController < ApplicationController

      before_action :set_playlist, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = Tools.query params
        
        @playlists = Playlist.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

        respond_with @playlists,
        root: :playlists,
        meta: {
          current_page: @playlists.current_page,
          next_page: @playlists.next_page,
          prev_page: @playlists.prev_page,
          total_pages: @playlists.total_pages,
          total_count: @playlists.total_count,
          limit: (params[:limit].to_i || 100).to_i
        }

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @playlist

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @playlist.update(playlist_params)

          render json: @playlist,status: :ok

        else

          render json: {error: true,errors: @playlist.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@playlist = Playlist.new playlist_params

  			if @playlist.save

  				render json: @playlist,status: :created

  			else

  				render json: {error: true,errors: @playlist.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @playlist.destroy

          render json: {playlist: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @playlist.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_playlist
        @playlist = Playlist.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def playlist_params
        params.require(:playlist).permit plist
      end

      def plist
        [:user_id, :track_id, :clock_time, :seek_time, :priority, :now_playing, :key, :username, :title, :src, :created_at, :updated_at]
      end

  	end
  end
end