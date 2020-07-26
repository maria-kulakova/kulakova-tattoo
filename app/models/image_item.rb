# frozen_string_literal: true

class ImageItem < ApplicationRecord
  belongs_to :section

  validates :position, uniqueness:   { scope: :section_id },
                       numericality: { only_integer: true, allow_blank: true }

  validate :image_presence, :image_type

  has_one_attached :image

  def image_presence
    errors.add(:image, 'is missing') unless image.attached?
  end

  def image_type
    return if ['image/jpeg', 'image/png'].include?(image.content_type)

    errors.add(:image, 'needs to be JPEG or PNG')
  end

  def thumbnail
    image.variant(resize: '150x150!').processed
  end

  def gallery_image
    image.variant(resize: '400x400!').processed
  end

  def gallery_image_url
    Rails.application.routes.url_helpers.rails_representation_url(gallery_image, only_path: true)
  end
end
