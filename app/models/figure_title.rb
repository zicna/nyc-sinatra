class FigureTitle < ActiveRecord::Base
  # add relationships here
  has_many :figure, through: :landmark
end
