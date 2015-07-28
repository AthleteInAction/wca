module Api
  module V1
  	class SoundcloudController < ApplicationController

      before_action :set_soundcloud, only: [:show, :update, :destroy]

      respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        # q = Tools.query params
        
        # @soundclouds = Soundcloud.where(q)
        # .page(params[:page])
        # .per((params[:limit] || 100).to_i)
        # .order(params[:order])

        # respond_with @soundclouds,
        # root: :soundclouds,
        # meta: {
        #   current_page: @soundclouds.current_page,
        #   next_page: @soundclouds.next_page,
        #   prev_page: @soundclouds.prev_page,
        #   total_pages: @soundclouds.total_pages,
        #   total_count: @soundclouds.total_count,
        #   limit: (params[:limit].to_i || 100).to_i
        # }

        # create a client object with your app credentials
        client = Soundcloud.new client_id: '4d0e36fdbe21f60751fa33f6c3ab37b9'

        # fetch track to stream
        track = client.get '/tracks/48961440'

        # # get the tracks streaming URL
        stream_url = client.get track['stream_url'],allow_redirects: true

        # # print the tracks stream URL
        puts '==='*10
        puts '==='*10
        puts stream_url
        puts '==='*10
        puts '==='*10

        render json: track

      end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @soundcloud

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @soundcloud.update(soundcloud_params)

          render json: @soundcloud,status: :ok

        else

          render json: {error: true,errors: @soundcloud.errors},status: :unprocessable_entity

        end

      end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@soundcloud = Soundcloud.new soundcloud_params

  			if @soundcloud.save

  				render json: @soundcloud,status: :created

  			else

  				render json: {error: true,errors: @soundcloud.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @soundcloud.destroy

          render json: {soundcloud: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @soundcloud.errors},status: :unprocessable_entity

        end

      end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_soundcloud
        @soundcloud = Soundcloud.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def soundcloud_params
        params.require(:soundcloud).permit plist
      end

      def plist
        [:created_at, :updated_at]
      end

    end
  end
end