

class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps


  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String

  has_secure_password

  validates :username, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

  validates :password, presence: true


  has_and_belongs_to_many :tasks, autosave: true, index: true
  has_and_belongs_to_many :pages, autosave: true, index: true

  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :pages

  def user_tasks
    self.tasks
  end




end
