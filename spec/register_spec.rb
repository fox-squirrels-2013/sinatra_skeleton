require_relative 'spec_helper'



describe "web requests" do

# User can register and that registration is stored in the database
  it "registers a new user" do
    params = {'user' => {'email' => 'goob@foob.com', 'name' => 'John Smith', 'password' => 'pass123'}}
    expect {post '/sign_up', params}.to change {User.all.length}.by(1)
  end

end





# REMINDER: If a person registers a new account while logged in to an existing account, the old account should be logged out and the new one should be logged in.
