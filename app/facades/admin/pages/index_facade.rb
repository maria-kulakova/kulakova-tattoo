# frozen_string_literal: true

module Admin
  module Pages
    class IndexFacade
      attr_reader :pages

      def initialize(pages = Page.all)
        @pages = pages
      end
    end
  end
end
