require 'nokogiri'
require 'open-uri'
require 'pry'
 
require_relative './course.rb'
 
    #the page itself 
     # doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
      #the collection of course offerings of website
     # doc.css(".post")
      #the title of an individual course offering 
      #doc.css(".post").first.css("h2").text
      #The schedule of an individual course offering
      #doc.css(".post").first.css(".date").text
      #The description of an individual course offering:
     # doc.css(".post").first.css("p").text
     
  class Scraper 
     def get_page 
doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    
  end 
  def get_courses 
    self.get_page.css(".post")
  end 
    def make_courses 
       self.get_courses.each do |post|
    course = Course.new
    course.title = post.css("h2").text
    course.schedule = post.css(".date").text
    course.description = post.css("p").text
  end
  

   def print_courses
    self.make_courses
   Course.all.each do |course|
     if course.title
     puts "Title: #{course.title}"
       puts "  Schedule: #{course.schedule}"
      puts "  Description: #{course.description}"
     end
   end
  
  Scraper.new.print_courses
  



