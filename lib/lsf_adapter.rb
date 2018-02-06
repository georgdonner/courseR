require 'rubygems'
require 'nokogiri'
require 'open-uri'

class LsfAdapter
  	def self.get_awe_courses
  		url = "https://lsf.htw-berlin.de/qisserver/rds?state=wtree&search=1&trex=step&root120172=21003|20893|20911"
		page = Nokogiri::HTML(open(url), nil, 'utf-8')
		course_links = page.css('a.ver')
		courses = course_links.map{|link| link.text}
  	end

end