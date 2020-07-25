# frozen_string_literal: true

module ApplicationHelper
  def header_pages
    PositionOrderQuery.call(collection: Page.all)
  end
end
