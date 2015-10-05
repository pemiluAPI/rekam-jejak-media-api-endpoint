namespace :run do
  desc "runing method gsearch on paslon model"
  task gsearch: :environment do
		ActiveRecord::Base.connection.execute("TRUNCATE TABLE rekam_jejaks")
    puts "[Truncate Table] data rekam jejak"
  	Paslon.gsearch
  end

end
