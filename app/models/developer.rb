class Developer < ApplicationRecord
  belongs_to :user

  before_save :generate_api_key

  def generate_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
