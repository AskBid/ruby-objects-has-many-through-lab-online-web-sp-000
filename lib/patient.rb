class Patient
	attr_accessor :name

	@@all = []

	def initialize(name)
		@name = name
		@@all << self
	end

	def new_appointment(doctor, date)
		Appointment.new(date, self, doctor)
	end

	def appointments
		Appointment.all.select {|app| app.patient == self}
	end

	def self.all
		@@all
	end

	def doctors
		Appointment.all.map {|app| app.doctor if app.patient == self}
	end

end