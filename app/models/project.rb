class Project < ApplicationRecord
  belongs_to :session, inverse_of: :projects
end
