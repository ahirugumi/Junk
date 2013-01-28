require 'csv'
require 'erb'

csv = CSV.open("hoge.csv", 'r')
csv.shift
ERB.new(DATA.read, nil, '-').run(binding)
__END__
var servers = {
    "web_servers": [<% csv.each_with_index do |i,j| -%>
        <%= ","unless j==0 -%>{
            "address":"<%= i[0] %>",
            "host": "<%= i[1] %>",
            "enviroment": "<%= i[2] %>",
            "use": "<%= i[3] %>",
            "instance": "<%= i[4] %>",
            "admin": "<%= i[5] %>",
            "user": "<%= i[6] %>",
            "url": "<%= i[7] %>"
        }<% end -%>
    ]
};
