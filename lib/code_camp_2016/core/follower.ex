defmodule CodeCamp2016.Core.Follower do
  @twitter_api Application.get_env(:code_camp_2016, :twitter_api)

  def match_followers(username1, username2) do
  end

  def followers_ids(username) do
    username
    |> @twitter_api.followers
    |> parse_ids
    |> MapSet.new
  end

  defp parse_ids(%{items: items}), do: items
  defp parse_ids(_anything), do: :error

end
