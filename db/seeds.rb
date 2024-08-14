def create_site_admin
  1.times do |a|
    User.create(email: "site_admin1@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                username: "SiteUser",
                full_name: "Site Admin",
                roles: "site_admin")
  end

  puts "1 site admin created"
end

def create_users
  500.times do |u|
    User.create(email: "user#{u+1}@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                username: "User#{u+1}",
                full_name: "User #{u}Name")
  end

  puts "#{User.count} users created"
end

create_site_admin
create_users

topic1 = Topic.create!(title: "Topic 1")
topic2 = Topic.create!(title: "Topic 2")

100.times do |post|
  if post.even?
    u = User.all.sample
  else
    u = User.second
  end
  t = Topic.all.sample
  this_post = Post.create!(title: Faker::Hipster.sentence,
                           content: Faker::Hipster.paragraph(sentence_count: 20),
                           user_id: u.id)
  Theme.create!(topic_id: t.id, post_id: this_post.id)
end
