# frozen_string_literal: true

class PagesController < ApplicationController
  layout 'application'

  def index
    @facade = Pages::IndexFacade.new
  end

  def show
    @page   = Page.find_by(id: params[:id])
    @facade = Pages::ShowFacade.new(page: @page)
  end
end
