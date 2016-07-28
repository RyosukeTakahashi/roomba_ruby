require 'serialport'
sp = SerialPort.new('/dev/tty.SLAB_USBtoUART', 115200, 8, 1, 0)

# look for the port by entering terminal 'ls /dev'
# It should be pretty clear. Somthing like '/dev/tty.SLAB_USBtoUART'
# Change it to the port you are using.

test_sequence = [128, 130, 135]

# try the command below in case you want test it. It should start cleaning

# for command in test_sequence do
#   sp.write command.chr
# end

# Set the time.
now = Time.now
time_sequence = [168, now.wday, now.hour, now.min]

for command in time_sequence do
  sp.write command.chr
end

# Set scheduling. This will make roomba start everyday 4am.
# Change the 4s and 0s to set it to a desired time.
# Look for Roomba Open Interface document for further info.
sequence = [167, 255, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0]

for command in sequence do
  sp.write command.chr
end

