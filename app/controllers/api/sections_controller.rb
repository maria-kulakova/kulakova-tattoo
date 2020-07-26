# frozen_string_literal: true

module Api
  class SectionsController < ApplicationController
    def show
      @section = Section.find_by(id: params[:id])

      render json: @section
    end
  end
end
