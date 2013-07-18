require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CSV.foreach(Rails.root.join('lib','assets','medications.csv')) do |line|
  if Medication.where(id: line[0]).blank?
    puts "trying to import #{line[0]} -> #{line[2]}"
    Medication.create(id: line[0], name: line[2])
  end
end

CSV.foreach(Rails.root.join('lib','assets','med_and_nui.csv')) do |line|
  medication_name = line[0].humanize
  medication = Medication.where(name: medication_name).first
  unless medication.blank?
    medication.nui = line[1]
    puts "updating #{medication_name}" if medication.save
  end
end