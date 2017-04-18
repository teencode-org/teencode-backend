class Resource < ApplicationRecord
  belongs_to :session, inverse_of: :resources
end
