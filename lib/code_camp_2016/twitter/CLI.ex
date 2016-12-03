defmodule CodeCamp2016.Twitter.CLI do

  def followers(username) do
    username
    |> ExTwitter.follower_ids
  end

<<<<<<< HEAD
  def screen_name(user_id) do
    user_id
    |> ExTwitter.user
=======
  def friends(username) do
    username
    |> ExTwitter.friend_ids
>>>>>>> 1b8e8f8d2ffa7241853d652b1b957cf84d763580
  end

end
