class UserDecorator < ApplicationDecorator
  delegate_all

  def image_resize(width, height)
    if !avatar.attached?
      return '/images/sakana.jpg'
    end
    
    avatar.variant(resize_to_limit: [width, height]).processed
  end
end