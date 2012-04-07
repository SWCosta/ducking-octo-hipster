# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!( :email => "yuszuv@gmx.de",
              :password => "foobar" )

20.times do |i|
  User.create!( :email => "test#{i}@fucklove.de",
                :password => "foobar" )
end

50.times do |i|
  Bin::File.create!(:name => "file#{i}",
                    :ext => ["jpg","exe","tar"][i],
                    :size => i*Time.now.to_i % 3000 )
end
                
