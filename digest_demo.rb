require 'digest/sha1'

user_name = "clockworkorange"
password = "greeneggsandham"

stored_hash = "e20dd27169f4be6f8f0c488be138bf2ecafa8643"

return "AUTHENTICATED" if Digest::SHA1.hexdigest("greeneggsandham") == stored_hash

return "ACCESS DENIED"
