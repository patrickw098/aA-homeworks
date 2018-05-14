# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  year       :integer          not null
#  title      :string           not null
#  band_id    :integer          not null
#  live       :boolean          default(FALSE), not null
#

class Album < ApplicationRecord
  validates :band_id, presence: true
  validates :year, :title, presence: true

  belongs_to :band,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Band

  has_many :tracks,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Track
end
