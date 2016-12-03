defmodule CodeCamp2016.Core.Follower do
  @twitter_api Application.get_env(:code_camp_2016, :twitter_api)

  def match_followers(username1, username2) do
    username1_followers = followers_ids(username1) |> MapSet.new
    username2_followers = followers_ids(username2) |> MapSet.new

    MapSet.intersection(username1_followers, username2_followers)
  end

  def followers_ids(username) do
    username
    |> @twitter_api.followers
    |> parse_ids
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
