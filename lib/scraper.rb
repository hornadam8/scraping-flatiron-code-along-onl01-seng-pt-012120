require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  
  
  def make_courses
    self.get_courses.each do |course| 
      course = Course.new 
      course.title = self.get_courses.css(".h2").text 
      course.schedule = self.get_courses.css(".em.date").text 
      course.description = self.get_courses.css(".p").text
    end
  end
end



