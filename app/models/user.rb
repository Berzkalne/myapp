class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :age, presence: true
  validates :password_confirmation, presence: true
  validates :password, confirmation: true

  before_save :encrypt_password

  def check_password(login_password)
    if login_password.present?
      encrypted_login_password = Digest::SHA1.hexdigest(login_password)
      self.password == encrypted_login_password
    end
  end
  
  private

  def encrypt_password
    if password.present? || password_changed?
      encrypted_password = Digest::SHA1.hexdigest(password)
      self.password = encrypted_password
    end
  end
end
