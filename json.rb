require 'json'
file = File.read('./game.rb')

data_hash = JSON.parse(file)
puts data_hash
data_hash["key"]+=1


# require 'json'
#
# @point = {J1:0, J2:0}
#
# File.write('./game.rb', @point.to_json)
#
# @point = JSON.parse(File.read('./game.rb'))
#

# # ...and save it again - this will overwrite the existing file:
# File.write('./game.rb', @point.to_json)


 file.close
#
# data_hash = @point.to_json
