require 'csv'
require 'erb'

csv = CSV.open("ファイル名.csv", 'r')
csv.shift
e = ERB.new <<EOS, nil, '-'
<% csv.each do |i| -%>
{
    "address":"<%= i[0] %>",
    "host":"<%= i[1] %>",
    "enviroment":"<%= i[2] %>",
    "use":"<%= i[3] %>",
    "instance":"<%= i[4] %>",
    "admin":"<%= i[5] %>",
    "user":"<%= i[6] %>",
    "url":"<%= i[7] %>"
}
<% end -%>
EOS
e.run