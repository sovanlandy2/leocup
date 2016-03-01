# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

# Regions

regions = ["មណ្ឌលភ្នំពេញ", "មណ្ឌលក្រុងព្រះស៊ីហនុ", "មណ្ឌលកំពង់ចាម", "មណ្ឌលបាត់ដំបង", "មណ្ឌលសៀមរាប"]
regions.each do |name|
	region = Region.where(name: name).first_or_create!
end

AdminUser.where(email: 'landy@leocup.com').first_or_create(password: 'landy123', password_confirmation: 'landy123')
AdminUser.where(email: 'dara@leocup.com').first_or_create(password: 'dara1234', password_confirmation: 'dara1234')
AdminUser.where(email: 'mardy@leocup.com').first_or_create(password: 'mardy123', password_confirmation: 'mardy123')
AdminUser.where(email: 'moderator@leocup.com').first_or_create(password: 'leocup123', password_confirmation: 'leocup123')

Tournament.where(name: 'Phnom Penh Qualifiers').first_or_create(visible: true)
Tournament.where(name: 'Kompongcham Qualifiers').first_or_create(visible: true)
Tournament.where(name: 'Siem Reap Qualifiers').first_or_create(visible: true)
Tournament.where(name: 'Battambong Qualifiers').first_or_create(visible: true)
Tournament.where(name: 'Shihanouk Ville Qualifiers').first_or_create(visible: true)
Tournament.where(name: 'Leo Cup National Volleyball Cup').first_or_create(visible: true)