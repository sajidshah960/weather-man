#March 2011
#01 +++++++++++++++++++++++++++++++++++ 11C - 25C
require 'colorize'
module Problem4
  @date
  #month, city, year
  @months = Hash[1 => 'Jan', 2 => 'Feb', 3 => 'Mar', 4 => 'Apr', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'Aug',9 => 'Sep',
     10 => 'Oct', 11 => 'Nov', 12 => 'Dec']

     def self.main(city, year , month)
      monthly_file=MonthFile(city, year , month )
      puts "#{@months[month.to_i]} #{year}"
      printFormat (monthly_file)


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
    def self.printer (temp)
      str=""
      temp.times do
        str+= "+"
      end
      #str+="#{temp}C"
      str
    end

    def self.printFormat(file)
    file_lines=File.readlines(file)
    file_lines.delete_at(0)


    file_lines.each do|line|
      arr=line.split(",")
      @date=arr[0].split("-")[2]
      higtemp=arr[1].to_i
      lowtemp=arr[3].to_i
      puts "#{@date} "+printer(higtemp).red + printer(lowtemp).blue + "#{higtemp} - #{lowtemp}"
      puts
    end
  end
  end
  #date city
  input=ARGV
  date=ARGV[1].split("/")
  #city year month
  Problem4.main(ARGV[0],date[0],date[1])

#ruby problem4.rb "Murree_weather" "2009/09"
