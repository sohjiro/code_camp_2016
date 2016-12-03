defmodule CodeCamp2016.Twitter.CLI do

  def followers(username) do
    username
    |> ExTwitter.API.FriendsAndFollowers.follower_ids
  end

end
