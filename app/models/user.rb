class User < ActiveRecord::Base

	validates :username, presence: { message: "用户名不能为空"}
	validates :username, uniqueness: { message: "用户名已存在"}

	attr_accessor :password
	attr_accessor :password_confirmation

	validate :validate_password, on: :create
	before_create :set_password
	
	has_many :carts
	has_many :addresses

	def validate_password
		password_isblank?
		password_notsame?
		return true
	end

	def self.user_istrue? username, password
		@user = User.find_by(username: username)
		if @user and @user.password_istrue?(password) 
			if @user.is_active == true
				@user
			end
		else
			nil
		end
	end

	def self.user_isadmin? username, password
		@user = User.find_by(username: username)
		if @user and @user.password_istrue?(password) 
			if @user.is_admin == true
				@user
			end
		else
			nil
		end
	end

	def password_istrue? password
		self.crypted_password == Digest::SHA256.hexdigest(password + self.salt)
	end

	def newrandom(len)
  	newpass = ""
  	1.upto(len){ |i| newpass << rand(10).to_s}
  	return newpass
	end

	private

		def password_isblank?
			if self.password.blank?
				self.errors.add(:password, "密码不能为空 ")
				return false
			end
		end

		def password_notsame?
			unless self.password == self.password_confirmation
				self.errors.add(:password, "密码不一致")
				return false
			end
		end

		def set_password
			self.salt = Time.now.to_s
			self.crypted_password = Digest::SHA256.hexdigest(self.password + self.salt)
		end

end
