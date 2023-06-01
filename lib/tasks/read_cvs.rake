require 'csv'

desc 'Parse hospital names cvs'
task parse_cvs: :environment do
  csv_data = CSV.read(File.join(Rails.root, 'lib', 'tasks', 'hospitals.csv'))

  # Читання даних по рядках
  #csv_data.each do |row|
  #  city = row[1]
  #  type = row[3]
  #  rating = row[5]
  #  puts(city+", "+type+", "+rating)
  #end

  klinikas = Klinika.all
  i = 0
  csv_data.each do |row|
    if( i < klinikas.size and i != 0)
      city = row[1]
      type = row[3]
      rating = row[5]
      klinikas[i-1].city = city.to_s
      klinikas[i-1].typeHospital = type.to_s
      klinikas[i-1].RatingMortality = rating.to_s
    end
    i+=1
  end
end