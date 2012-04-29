require 'rake'

FG_GREEN="\033[32m"
FG_RED="\033[31m"
RESET="\033[0m"

#task :default => [:unfinished]
task :default => [:install_zsh, :install_bash, :install_vim, :install_git, :submodules]

task :unfinished do |t|
  puts "#{red('✘')} Still a work-in-progress. Come back later..."
end

task :install_zsh do |t|
  part = 'zsh'
  if confirm?(part)
    install_files(%w[oh-my-zsh zshrc aliases.sh])
  end
end

task :install_bash do |t|
  part = 'bash'
  if confirm?(part)
    install_files(%w[bash_profile inputrc aliases.sh])
  end
end

task :install_vim do |t|
  part = 'vim'
  if confirm?(part)
    install_files(%w[vimrc vim])
  end
end

task :install_git do |t|
  part = 'git'
  if confirm?(part)
    install_files(%w[githelpers])
  end
end

task :submodules do |t|
  puts "Initializing and updating submodules (this may take some time)..."
  if system(%Q{git submodule update --init})
    puts "#{green('✔')} Initialised submodules"
  else
    puts "#{red('✘')} Failed to initialise submodules"
  end
end

def install_files(files)
  replace_all = false

  files.each do |file|
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if File.identical?(file, File.join(ENV['HOME'], ".#{file}"))
        puts "#{green('✔')} Identical ~/.#{file}"
      elsif replace_all
        replace_file(file)
      else
        print "#{red('Overwrite')} ~/.#{file}? [ynaq] "
        case STDIN.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "#{red('✘')} Skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  if File.symlink?(File.join(ENV['HOME'], ".#{file}"))
    puts "#{green('✔')} Unlinking ~/.#{file}"
    system %Q{unlink "$HOME/.#{file}"}
  else
    puts "#{green('✔')} Removing ~/.#{file}"
    system %Q{rm -rf "$HOME/.#{file}"}
  end
  link_file(file)
end

def link_file(file)
  puts "#{green('✔')} Linking to ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def confirm?(part)
  print "Would you like to install #{green(part)} configs? [yn] "
  STDIN.gets.chomp == 'y'
end

def green(text)
  "#{FG_GREEN}#{text}#{RESET}"
end

def red(text)
  "#{FG_RED}#{text}#{RESET}"
end
