# frozen_string_literal: true

class Section < ApplicationRecord
  belongs_to :page

  validates :position, uniqueness:   { scope: :page_id },
                       numericality: { only_integer: true }
  validates :widget, presence: true

  enum widget: {
    photos_gallery:        'photos_gallery',
    text_content:          'text_content',
    text_left_photo_right: 'text_left_photo_right',
    photo_left_text_right: 'photo_left_text_right'
  }
end
