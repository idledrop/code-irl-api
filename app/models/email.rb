class Email < ApplicationRecord
  belongs_to :hangout
  validates_presence_of :hangout
  validates_presence_of :email
end
