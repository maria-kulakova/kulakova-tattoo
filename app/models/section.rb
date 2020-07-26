# frozen_string_literal: true

class Section < ApplicationRecord
  belongs_to :page

  has_many :image_items, dependent: :destroy

  validates :position, uniqueness:   { scope: :page_id },
                       numericality: { only_integer: true, allow_blank: true }
  validates :widget, presence: true

  enum widget: {
    photos_gallery:        'photos_gallery',
    text_content:          'text_content',
    text_left_photo_right: 'text_left_photo_right',
    photo_left_text_right: 'photo_left_text_right'
  }

  accepts_nested_attributes_for :image_items, allow_destroy: true
end
