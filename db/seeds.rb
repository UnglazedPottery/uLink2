User.destroy_all
Post.destroy_all
Topic.destroy_all

puts " making users --------"
richard = User.create({username: "Richard", password: "Rockets94"})
bob = User.create({username: "Bob", password: "bob"})
puts " making topics --------"
html_topic = Topic.create({name: "HTML"})
ruby_topic = Topic.create({name: "CSS"})
javascript_topic = Topic.create({name: "Javascript"})
puts " making posts --------"
post1 = Post.create({url: "https://www.w3schools.com/html/default.asp", note: "w3schools HTML tutorial", likes: 0, user_id: 1, topic_id: 1})
post2 = Post.create({url: "https://www.codecademy.com/learn/learn-html", note: "codeacademy HTML intro course", likes: 0, user_id: 1, topic_id: 1})
