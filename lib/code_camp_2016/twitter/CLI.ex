defmodule CodeCamp2016.Twitter.CLI do

  def followers(username) do
    username
    |> ExTwitter.follower_ids
  end

  def screen_name(user_id) do
    user_id
    |> ExTwitter.user
  end

  def friends(username) do
    username
    |> ExTwitter.friend_ids
  end

end
