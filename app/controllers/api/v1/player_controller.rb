module Api
  module V1
  	class PlayerController < ApplicationController

      before_action :set_player, only: [:show, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        json = {
          session: Time.now,
          user_id: nil,
          seek_time: nil,
          clock_time: nil,
          playing: nil,
          track_id: nil
        }

        if !File.exists?(path) || params[:reset] == 'true'

          File.open path,'w+' do |f|

            f.write json.to_json

          end

        end

        final = JSON.parse File.read(path)

        offset = final['clock_time'] - (final['seek_time'] || 0)
        test = final['clock_time'] - offset

        final.merge! offset: offset,test: test

        render json: final

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @player

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        json = {
          session: Time.now
        }

        json.merge! player_params

        json[:user_id] = current_user.id

        File.open path,'w+' do |f|

          f.write json.to_json

        end

        render json: json,status: :ok

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@player = Player.new player_params

  			if @player.save

  				render json: @player,status: :created

  			else

  				render json: {error: true,errors: @player.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @player.destroy

          render json: {player: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @player.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_player
        @player = Player.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def player_params
        params.require(:player).permit plist
      end

      def path
        "#{Rails.root}/log/player.json"
      end

      def plist
        [:user_id,:seek_time,:clock_time,:playing,:track_id,:created_at, :updated_at]
      end

  	end
  end
end