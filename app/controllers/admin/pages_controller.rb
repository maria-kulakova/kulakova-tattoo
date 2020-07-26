# frozen_string_literal: true

module Admin
  class PagesController < ApplicationController
    before_action :set_page, only: %i[edit update destroy]

    def index
      @facade = Pages::IndexFacade.new
    end

    def new
      @page   = Page.new
      @facade = Pages::NewFacade.new(page: @page)
    end

    def create
      @page = Page.new(page_params)
      return redirect_to edit_admin_page_path(@page), notice: "Page #{@page.name} is created!" if @page.save

      redirect_to new_admin_page_path, alert: @page.errors.full_messages.to_sentence
    end

    def edit
      @facade = Pages::EditFacade.new(page: @page)
    end

    def update
      return redirect_to admin_pages_path, notice: "Page #{@page.name} is updated!" if @page.update(page_params)

      redirect_to edit_admin_page_path(@page), alert: @page.errors.full_messages.to_sentence
    end

    def destroy
      return redirect_to admin_pages_path, notice: 'Page is deleted!' if @page.destroy

      redirect_to admin_pages_path, alert: 'Page is not deleted!'
    end

    private

    def page_params
      params.require(:page)
            .permit(:name,
                    :position,
                    sections_attributes: %i[
                      id
                      widget
                      position
                      _destroy
                    ])
    end

    def set_page
      @page = Page.find_by(id: params[:id])
    end
  end
end
