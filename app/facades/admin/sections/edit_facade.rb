# frozen_string_literal: true

module Admin
  module Sections
    class EditFacade
      attr_reader :section, :page

      def initialize(section:)
        @section = section
        @page    = section.page
      end

      def form_partial
        "admin/sections/forms/#{@section.widget}"
      end
    end
  end
end
