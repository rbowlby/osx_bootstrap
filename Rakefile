require 'foodcritic'
require 'foodcritic/rake_task'
require 'rubocop/rake_task'

# Style tests (Foodcritic)
FoodCritic::Rake::LintTask.new

RuboCop::RakeTask.new do |t|
  t.formatters = ['progress']
  t.options = ['-D']
  t.patterns = %w(
    attributes/*.rb
    recipes/*.rb
    libraries/**/*.rb
    resources/*.rb
    providers/*.rb
    spec/**/*.rb
    test/**/*.rb
    ./metadata.rb
    ./Berksfile
    ./Gemfile
    ./Rakefile
  )
end

desc 'Run Style Tests'
task style: [:foodcritic, :rubocop]
