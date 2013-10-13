class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :content

  scope :mine, ->(user) { where( items: { user_id: user.id } ) }

  validates :name, presence: true

  # スター表示
  def star_display
    ('★' * self.star.to_i) + '：' + Settings.star[self.star]
  end

  private

  # スター表示
  def self.star_display(star)
    ('★' * star.to_i) + '：' + Settings.star[star]
  end
end
