# For a given year display the highest temperature and day, lowest temperature and day, most humid day and humidity.
# ruby weatherman.rb -e 2002 /path/to/filesFolder
# Highest: 45C on June 23
# Lowest: 01C on December 22
# Humid: 95% on August 14
#year city

#2. For a given month display the average highest temperature, average lowest temperature, average humidity.

module Problem1
  #month, city, year
  @yearfiles=[]
  @months = Hash[1 => 'Janruary', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August',9 => 'September',
     10 => 'October', 11 => 'November', 12 => 'December']

     def self.main(city, year)
      files_list=YearFiles(city,year)
      collect_data (files_list)


     end
    def self.YearFiles(city, year)
      #go to directly of city
      city_files= Dir["#{city}/*.txt"]


      city_files.each do |file|
        if file.include?(year)
         @yearfiles.push(file)
        end
      end
      @yearfiles
    end

  def self.collect_data(list)

      result=Array.new(3)
      highest=0
      lowest=0
      humid=0
      list.each do|file|   # one month here

        everyday=File.readlines(file) #every day
        everyday.delete_at(0)
        everyday.each do |temp|
          attribute=temp.split(",")
          if attribute[1].to_i>highest
            highest=attribute[1].to_i
            result[0]=attribute
          end
          if attribute[3].to_i<lowest
            lowest=attribute[3].to_i
            result[1]=attribute
        end
        if attribute[8].to_i>humid
          humid=attribute[8].to_i
          result[2]=attribute
      end
    end
  end
# Highest: 45C on June 23
# Lowest: 01C on December 22
# Humid: 95% on August 14

puts " Highest: #{result[0][1]} C on #{result[0][0].split("-")[2]} #{@months[result[0][0].split("-")[1].to_i]}"
puts " Lowest:  #{result[1][3]} C on #{result[1][0].split("-")[2]} #{@months[result[1][0].split("-")[1].to_i]}"
puts " Humid:   #{result[2][8]} % on #{result[2][0].split("-")[2]} #{@months[result[2][0].split("-")[1].to_i]}"
result
end




  end
  # 2005/6 cityfile
  input=ARGV
  #date=ARGV[1].split("/")
  #city year month
  Problem1.main(ARGV[0],ARGV[1])

# ruby problem1.rb "Murree_weather" 2009
