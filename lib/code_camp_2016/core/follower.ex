defmodule CodeCamp2016.Core.Follower do
  @twitter_api Application.get_env(:code_camp_2016, :twitter_api)

  def match_followers(username1, username2) do
    username1_followers = followers_ids(username1)
    username2_followers = followers_ids(username2)

    MapSet.intersection(username1_followers, username2_followers)
  end

  def match_friends(username1, username2) do
    username1_friends = followback(username1)
    username2_friends = followback(username2)

    MapSet.intersection(username1_friends, username2_friends)
  end

  def mutual_friends_relation(mutual_friends) do
    mutual_friends
    |> permute
  end

  defp permute(list) do
    import Enum
    (for x <- list, y <- list, x != y, do: [x, y])
    |> map(&sort/1)
    |> uniq
    |> map(&List.to_tuple/1)
  end

  def followers_ids(username) do
    username
    |> @twitter_api.followers
    |> parse_ids
    |> MapSet.new
  end

  def friends_ids(username) do
    username
    |> @twitter_api.friends
    |> parse_ids
    |> MapSet.new
  end

  def followback(username) do
    followers = followers_ids(username)
    friends = friends_ids(username)

    MapSet.intersection(friends, followers)
  end


  defp parse_ids(%{items: items}), do: items
  defp parse_ids(_anything), do: :error

end
