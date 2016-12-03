defmodule CodeCamp2016.Twitter.CLI do

  def followers(username) do
    username
    |> ExTwitter.follower_ids
  end

end
