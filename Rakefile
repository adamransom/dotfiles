require 'rake'

FG_GREEN="\033[32m"
FG_RED="\033[31m"
RESET="\033[0m"

task :default => [:unfinished]
#task :default => [:install_zsh, :install_bash, :install_vim, :install_git]

task :unfinished do |t|
  puts "#{red('✘')} Still a work-in-progress. Come back later..."
end

task :install_zsh do |t|
  part = 'zsh'
  if confirm?(part)
    puts "Installing #{green('zsh')} configs..."
  end
end

task :install_bash do |t|
  part = 'bash'
  if confirm?(part)
    puts "Installing #{green('bash')} configs..."
  end
end

task :install_vim do |t|
  part = 'vim'
  if confirm?(part)
    puts "Installing #{green('vim')} configs..."
  end
end

task :install_git do |t|
  part = 'git'
  if confirm?(part)
    puts "Installing #{green('git')} configs..."
  end
end

def confirm?(part)
  print "Would you like to install #{green(part)} configs? (y/n) [y]: "
  answer = STDIN.gets.chomp
  not answer == 'n'
end

def green(text)
  "#{FG_GREEN}#{text}#{RESET}"
end

def red(text)
  "#{FG_RED}#{text}#{RESET}"
end
