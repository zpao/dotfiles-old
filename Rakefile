require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  pwd = `pwd`.strip
  Dir['*'].each do |file|
    next if %w[Rakefile README LICENSE].include? file
    f = File.join(ENV['HOME'], ".#{file}")
    next if File.exist?(f) &&
            File.ftype(f) == "link" &&
            File.readlink(f) == "#{pwd}/#{file}"
    
    if File.exist?(f)
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
