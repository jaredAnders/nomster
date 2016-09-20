class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

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
end
