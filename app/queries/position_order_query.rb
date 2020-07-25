# frozen_string_literal: true

class PositionOrderQuery < ApplicationQuery
  def initialize(collection:, order: :asc)
    @collection = collection
    @order      = order
  end

  def call
    @collection
      .where
      .not(position: nil)
      .order(position: @order)
  end
end
