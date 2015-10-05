namespace :run do
  desc "runing method gsearch on paslon model"
  task gsearch: :environment do
		ActiveRecord::Base.connection.execute("TRUNCATE TABLE sumber_media")
		ActiveRecord::Base.connection.execute("TRUNCATE TABLE rekam_jejaks")
    puts "[Truncate Table] data sumber media & rekam jejak"
  	Paslon.gsearch
  end

end
