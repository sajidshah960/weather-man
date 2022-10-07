
#2. For a given month display the average highest temperature, average lowest temperature, average humidity.

module Problem2
#month, city, year
@months = Hash[1 => 'Jan', 2 => 'Feb', 3 => 'Mar', 4 => 'Apr', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'Aug',9 => 'Sep',
   10 => 'Oct', 11 => 'Nov', 12 => 'Dec']

   def self.main(city, year , month)
    monthly_file=MonthFile(city, year , month )
    find_average (monthly_file)

   end
  def self.MonthFile(city, year , month )

    #go to directly of city
    city_files= Dir["#{city}/*.txt"]


    city_files.each do |file|
      if file.include?(year) && file.include?(@months[month.to_i])

        @a=file
      end
    end
    @a
  end
def self.find_average(file)
  file_lines=File.readlines(file)
  file_lines.delete_at(0)
  counter=0
  high_temp_sum=0
  low_temp_sum=0
  mean_humidity_sum=0

  file_lines.each do|line|
    arr=line.split(",")
    high_temp_sum+=arr[1].to_i
    low_temp_sum+=arr[3].to_i
    mean_humidity_sum+=arr[8].to_i
    counter+=1
  end


  puts "Highest Average: #{high_temp_sum/counter} C"
  puts "Lowest Average: #{low_temp_sum/counter} C"
  puts "Average Humidity: #{mean_humidity_sum/counter} %"
end


end
# 2005/6 cityfile
input=ARGV
date=ARGV[1].split("/")
#city year month
Problem2.main(ARGV[0],date[0],date[1])

#run with : ruby problem2.rb "Murree_weather" "2009/09"
