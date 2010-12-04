ENV['EDITOR'] = "mate"
require 'pp'

# http://blog.nicksieger.com/articles/2006/04/23/tweaking-irb
ARGV.concat ["--readline", "--prompt-mode", "simple"]

require 'irb/completion'
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = File.expand_path('~/.irb_history')

# Wirble is a set of enhancements for irb
# http://pablotron.org/software/wirble/README
# Implies require 'pp', 'irb/completion', and 'rubygems'
begin
  require 'wirble'
  Wirble.init

  # Enable colored output
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load wirble: #{err}"
end


# http://ozmm.org/posts/time_in_irb.html
def time(times = 1)
  require 'benchmark'
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end

# Tomtt method info stuff
def set_method_info_default_options
  require 'term/ansicolor'
  require 'method_info'
  
  MethodInfo::OptionHandler.default_options = {
    :ancestors_to_exclude => [Object],
    :enable_colors => true,
    :color_methods => Term::ANSIColor.cyan,
    :color_punctuation => Term::ANSIColor.blue
  }
end
set_method_info_default_options

# view method to copy / paste stuff straight into editor. Tomtt stuff
begin
  require 'string_to_editor'
rescue LoadError => err
  warn "Couldn't load string_to_editor: #{err}"
end

# list object methods
def local_methods(obj=self)
  (obj.methods - obj.class.superclass.instance_methods).sort
end

# Found in http://github.com/rtomayko/dotfiles/blob/rtomayko/.irbrc
def ls(obj=self)
  width = `stty size 2>/dev/null`.split(/\s+/, 2).last.to_i
  width = 80 if width == 0
  local_methods(obj).each_slice(3) do |meths|
    pattern = "%-#{width / 3}s" * meths.length
    puts pattern % meths
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def copy_history
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

def paste
  `pbpaste`
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']
