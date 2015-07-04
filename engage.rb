require 'continuation'

class TimeWarp

  def initialize
    @already_said_foo = false
    @already_said_bar = false
    @already_said_baz = false
  end
  
  def say_foo(cc)
    puts "foo!"
    @already_said_foo = true
    cc.call
  end

  def say_bar(cc)
    puts "bar!"
    @already_said_bar = true
    cc.call
  end

  def say_baz(cc)
    puts "baz!"
    @already_said_baz = true
    cc.call
  end

  def main
    foo_cc = callcc {|c| c }
    unless @already_said_foo
      say_foo(foo_cc)
    end
    bar_cc = callcc {|c| c }
    unless @already_said_bar
      say_bar(bar_cc)
    end
    baz_cc = callcc {|c| c }
    unless @already_said_baz
      say_baz(baz_cc)
    end
  end
  
end

TimeWarp.new.main
