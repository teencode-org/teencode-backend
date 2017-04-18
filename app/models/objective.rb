class Objective < ApplicationRecord
  belongs_to :session, inverse_of: :objectives
end
