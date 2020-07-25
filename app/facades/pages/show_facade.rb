# frozen_string_literal: true

module Pages
  class ShowFacade
    attr_reader :page

    def initialize(page:)
      @page = page
    end

    def sections
      PositionOrderQuery.call(collection: @page.sections)
    end

    def widget(section)
      "pages/widgets/#{section.widget}"
    end

    def image_urls(section)
      section.image_items.map(&:gallery_image)
    end
  end
end
