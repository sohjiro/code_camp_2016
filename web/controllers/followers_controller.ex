defmodule CodeCamp2016.FollowersController do
	use CodeCamp2016.Web, :controller
	alias CodeCamp2016.Core.Follower, as: TwitterClient

	def show(conn, %{"user1" => user1,"user2" => user2}) do
		conn
      |> put_status(200)
      |> json (%{user1: TwitterClient.followers_ids(user1) |> translate_to_string,
      	         user2: TwitterClient.followers_ids(user2) |> translate_to_string} )
	end

	def match(conn, %{"user1" => user1,"user2" => user2}) do
		conn
      |> put_status(200)
      |> json (%{matching: TwitterClient.match_followers(user1,user2)|> translate})
	end

	def translate_to_string(user_ids) do
		Enum.map(user_ids, fn(id) -> 
			to_string(id) 
		end)
	end

	def translate(user_ids) do
		Enum.map(user_ids, fn(id) -> 
			IO.inspect TwitterClient.follower_screen_name(id)
		end)
	end
end