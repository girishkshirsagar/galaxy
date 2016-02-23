require "/home/user/galaxy/lib/conversion"
require "/home/user/galaxy/lib/roman"

  conv = Conversion.new
  conv.process
  p conv.calculate(ARGV[0])

