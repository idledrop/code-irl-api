class Hangout < ApplicationRecord
  belongs_to :code
  has_many :emails
  validates_presence_of :code

  def add_email (email)
    self.emails.new(email: email)
  end

  def start?
    self.emails.count > 1
  end
end
