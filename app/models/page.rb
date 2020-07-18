# frozen_string_literal: true

class Page < ApplicationRecord
  has_many :sections, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :sections, allow_destroy: true
end
