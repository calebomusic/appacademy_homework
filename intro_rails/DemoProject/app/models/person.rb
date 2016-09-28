class Person < ApplicationRecord
  validate: :name, :house_id, :presence => true
end
