begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = 'rzotero'
    gemspec.summer = 'A Ruby client for the Zotero API'
    gemspec.description = 'rZotero provides a simple and extensible library for working with the Zotero API'
    gemspec.email = 'wayne.graham@gmail.com'
    gemspec.homepage = 'http://github.com/waynegraham/rZotero'
    gemspec.authors = ['Wayne Graham']
    
    gemspec.files = FileList['lib/**/*.rb', 'LICENSE', 'README.rdoc', 'CHANGES', 'VERSION']
    
    gemspec.test_files = ['spec/**/*.rb', 'Rakefile', 'tasks/spec.rake', 'tasks/rdoc.rake']
    
    now = Time.now
    gemspec.date = "#{now.year}-#{now.month}-#{now.day}"
    
    gemspec.has_rdoc = true
  end
  
rescue LoadError
  puts "Jeweler not available. Install it with: 'gem install jeweler'"
end