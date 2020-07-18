# frozen_string_literal: true

module Admin
  module Pages
    class NewFacade
      attr_reader :page

      ACTION = 'new'

      def initialize(page = Page.new)
        @page = page
      end

      def sections_for_select
        Section.widgets.map { |k, v| [k.humanize.upcase, v] }
      end

      def edit_section_link_show?(object, action)
        object.id.present? && action == ACTION
      end
    end
  end
end
