# frozen_string_literal: true

module Admin
  module Pages
    class EditFacade
      attr_reader :page

      ACTION = 'edit'

      def initialize(page:)
        @page = page
      end

      def sections_for_select
        Section.widgets.map { |k, v| [k.humanize.upcase, v] }
      end

      def edit_section_link_show?(object, action)
        object.id.present? && action == ACTION
      end

      def edit_section_link_title(section)
        "#{section.widget.humanize.upcase} edit"
      end
    end
  end
end
