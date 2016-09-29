class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email
  after_create :calc_avg_rating_place

  RATINGS = {
    '1'    => '1_star',
    '2'   => '2_stars',
    '3' => '3_stars',
    '4'  => '4_stars',
    '5'  => '5_stars'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end

  def calc_avg_rating_place
    # @place = Place.find(self.place_id)
    # @comments = Comment.where(place_id: @place)
    @comments = self.place.comments

    places_rating_sum = 0
    @comments.each do |comment|
      places_rating_sum = places_rating_sum + comment.humanized_rating.to_f
    end

    avg = places_rating_sum/@comments.count

    Place.update(@place, :average_rating => avg)

  end

  # def average_rating_user
  # end

end
