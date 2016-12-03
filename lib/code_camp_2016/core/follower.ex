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
    relations = mutual_friends
                |> permute
                |> twitter_friends([])
                |> format
    %{nodes: mutual_friends, relations: relations}
  end

  defp permute(list) do
    import Enum

    (for x <- list, y <- list, x != y, do: [x, y])
    |> map(&sort/1)
    |> uniq
    |> map(&List.to_tuple/1)
  end

  defp twitter_friends([], acc), do: acc
  defp twitter_friends([{x, y} | rest], acc) do
    case friends?(x, y) do
      true -> twitter_friends(rest, [{x, y} | acc])
      false -> twitter_friends(rest, acc)
    end
  end

  defp format(list), do: list |> Enum.uniq |> Enum.reverse

  defp friends?(user1, user2), do: user2 in followback(user1)

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

  def follower_screen_name(user_id) do
    user_id
      |> @twitter_api.screen_name
      |> parse_user
  end
 
  defp parse_user(%{screen_name: screen_name}), do: screen_name
  defp parse_user(_anything), do: :error
  defp parse_ids(%{items: items}), do: items
  defp parse_ids(_anything), do: :error

end
