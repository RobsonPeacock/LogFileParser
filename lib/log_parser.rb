class LogParser

  def parse_file(file_name)
    file_exist(file_name)
    create_array(file_name)
    print_results(file_name)
  end

  def file_exist(file_name)
    File.file?(file_name) ? true : 'File not found'
  end

  def create_array(file_name)
    File.read(file_name).split("\n").each do|entry|
      entry
    end
  end

  def page_visits(file_name)
    freq = Hash.new(0)
    create_array(file_name).each { |x| freq[x.gsub(/\s.+/, '')] += 1 }
    freq
  end

  def unique_page_visits(file_name)
    uniqfreq = Hash.new(0)
    create_array(file_name).each { |x| uniqfreq[x] += 1 }
    uniqfreq
  end

  def print_results(file_name)
    puts 'Page visits'
    puts '----------'
    page_visits(file_name).sort_by {|k,v| v}.reverse.each do |key, value|
      puts "#{key}----#{value} visits"
      puts "----------------------"
    end

    puts 'Page visits'
    puts '----------'
    unique_page_visits(file_name).sort_by {|k,v| v}.reverse.each do |key, value|
      puts "#{key}----#{value} visits"
      puts "----------------------"
    end
  end

end
