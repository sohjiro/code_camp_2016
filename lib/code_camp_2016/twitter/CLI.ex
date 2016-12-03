defmodule CodeCamp2016.Twitter.CLI do

  def followers(username) do
    username
    |> ExTwitter.follower_ids
  end

  def friends(username) do
    username
    |> ExTwitter.friends_ids
  end

end
