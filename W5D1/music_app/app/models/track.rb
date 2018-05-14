# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ord        :integer          not null
#  lyrics     :text
#  album_id   :integer          not null
#  title      :string           not null
#  type       :string           not null
#

class Track < ApplicationRecord
  validates :ord, :album_id, :title, presence: true
  validate :hidden_or_bonus

  def hidden_or_bonus
    self.type == "Hidden" || self.type == "Bonus"
  end

  belongs_to album:
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album

  has_one :band,
  through: :albums,
  source: :band

end
