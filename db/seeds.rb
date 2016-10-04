puts '[START SEED]' + " at #{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}"

Role.delete_all
admin 			= Role.create( name: 'admin' )
puts 'role created!' + " at #{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}"

User.delete_all
administrator 	= User.create( user_name: 'Administrator', email: 'admin@eoffice.com', password: 'admin123', role_ids: [admin.id])
puts 'admin created!' + " at #{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}"