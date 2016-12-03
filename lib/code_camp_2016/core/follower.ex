defmodule CodeCamp2016.Core.Follower do
  @twitter_api Application.get_env(:code_camp_2016, :twitter_api)

  def match_followers(username1, username2) do
    username1_followers = followers_ids(username1) |> MapSet.new
    username2_followers = followers_ids(username2) |> MapSet.new

    MapSet.intersection(username1_followers, username2_followers)
  end

  def match_friends(username1, username2) do
    username1_friends = followback(username1) |> MapSet.new
    username2_friends = followback(username2) |> MapSet.new

    MapSet.intersection(username1_friends, username2_friends)
  end

  def followers_ids(username) do
    username
    |> @twitter_api.followers
    |> parse_ids
  end

  def friends_ids(username) do
    username
    |> @twitter_api.friends
    |> parse_ids
  end

  def followback(username) do
    followers = followers_ids(username) |> MapSet.new
    friends = friends_ids(username) |> MapSet.new

    friends
    |> MapSet.intersection(followers)
    |> MapSet.to_list
  end


  defp parse_ids(%{items: items}), do: items
  defp parse_ids(_anything), do: :error

end
