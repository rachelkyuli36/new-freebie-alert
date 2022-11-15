Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
      # each returned element will be a hash whose key is the table header.
      # you should arrange to add that movie to the database here.
      User.create(:username => user['username'], :email => user['email'], :password => user['password'])
    end
end

Given /a valid user/ do
    @user = User.find_by(email: 'testing@columbia.edu')
end