# frozen_string_literal: true

module Admin
  class SectionsController < ApplicationController
    before_action :set_section, only: %i[edit update]

    def edit
      @facade = Sections::EditFacade.new(section: @section)
    end

    def update
      if @section.update(section_params)
        return redirect_to edit_admin_page_path(@section.page), notice: 'Section is updated!'
      end

      redirect_to edit_admin_page_section_path(@section), alert: @section.errors.full_messages.to_sentence
    end

    private

    def section_params
      params.require(:section)
            .permit(:title,
                    :position,
                    :text_content,
                    image_items_attributes: %i[
                      id
                      image
                      position
                      _destroy
                    ])
    end

    def set_section
      @section = Section.find_by(id: params[:id])
    end
  end
end
