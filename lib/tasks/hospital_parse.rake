require 'nokogiri'
require 'open-uri'
require 'rake'

desc 'Parse hospital names'
task parse_hospitals: :environment do
  url = 'https://www.hospitalsafetygrade.org/all-hospitals'

  doc = Nokogiri::HTML(URI.open(url))

  hospital_names = doc.css('#BlinkDBContent_849210 ul li a').map(&:text)

  klinikas = Klinika.all
  i = 0
  hospital_names.each do |name|
    if( i < klinikas.size)
      klinikas[i].name = name
      klinikas[i].save
      i+=1
    end
  end
end