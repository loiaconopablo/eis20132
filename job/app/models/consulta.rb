class Consulta
	include DataMapper::Resource

	property :id, Serial
	property :title, String
	property :description, String
	belongs_to :user

	validates_presence_of :title
	
	def owner
		user
	end

	def owner=(a_user)
		self.user = a_user
	end

	def self.find_by_owner(user)
		Consulta.all(:user => user)
	end

end