class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :content

  scope :mine, ->(user) { where( items: { user_id: user.id } ) }

  # スター表示
  def star_display
    ('★' * self.star) + '：' + Settings.star[self.star]
  end
end
