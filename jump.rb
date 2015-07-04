require 'continuation'

# from http://bit.ly/1NDt730

def output(cc, message)
  puts message
  # returns the original continuation so it can be re-used.
  # if the continuation is *not* called with the original,
  # the value of 'cc' on line 15 will be nil.
  cc.call(cc)
end

def messages
  m = %w(continuations are strange beasts indeed)
  cc = callcc { |c| c }
  unless m.empty?
    output(cc, m.shift)
  end
end

messages
