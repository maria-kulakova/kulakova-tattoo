# frozen_string_literal: true

class SectionSerializer < ActiveModel::Serializer
  attributes :id, :text_content, :title, :urls

  def urls
    object.image_items.map(&:gallery_image_url)
  end
end
