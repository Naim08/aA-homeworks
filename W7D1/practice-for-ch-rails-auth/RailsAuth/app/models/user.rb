class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }, allow_nil: true
  validates :session_token, presence: true, uniqueness: { message: 'Session token must be unique' }
  after_initialize :ensure_session_token
  attr_reader :password

  def self.generate_unique_session_token
    token = SecureRandom.urlsafe_base64
    token = SecureRandom.urlsafe_base64 while User.exists?(session_token: token)
    token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user

    user.password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = User.generate_unique_session_token
    save!
    session_token
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_unique_session_token
  end
end
