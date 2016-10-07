module PlacesHelper
  def photo_caption(photo)
    html = ""
      if photo.caption.present?
        html+= '<div class="carousel-caption">'
        html+= photo.caption
        html+= '</div>'
      end
    html
  end
end
