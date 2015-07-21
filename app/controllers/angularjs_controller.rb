class AngularjsController < ApplicationController

	def index

		list = ['new_round','teetime_generator','scorecard','comments']

		page = params[:page] if list.include?(params[:page])

		valid = list.include? params[:page]

		if valid

			render page,layout: false

		else

			render json: {},status: 404

		end

	end

end