class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :team_votes

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email rescue SecureRandom.hex(8) + "@gmail.com"
        user.oauth_token = auth.credentials.token
        user.password  = SecureRandom.hex(8)
        user.save!
  	end
  end

  def self.export_data
    User.all.each do |user|
      begin
        user.get_data_from_fb
        if user.hometown.present?
          puts user.hometown
        end
        user.save
      rescue
      end
    end
  end

  def self.output
    User.all.each do |user|
      age = JSON.parse(user.age_range)
      age_range = "#{age['min']}-#{age['max']}"
      puts "#{user.name}, #{user.gender}, #{age_range}"
    end
  end

  def get_data_from_fb
    data = RestClient.get("https://graph.facebook.com/v2.6/#{self.uid}?access_token=#{self.oauth_token} && fields=name,id,age_range,gender,location,hometown")
    nodes = JSON.parse(data)
    self.age_range = nodes["age_range"].to_s if nodes["age_range"].present?
    self.gender = nodes["gender"] if nodes["gender"].present?
    self.hometown = nodes["hometown"] if nodes["hometown"].present?
    self.location = nodes["location"] if nodes["location"].present?
  end
end
