defmodule CodeCamp2016.FollowersController do
	use CodeCamp2016.Web, :controller
	alias CodeCamp2016.Core.Follower, as: TwitterClient

	def show(conn, %{"user1" => user1,"user2" => user2}) do
		conn
      |> put_status(200)
      |> json(%{user1: TwitterClient.followers_ids(user1) |> translate_to_string,
                user2: TwitterClient.followers_ids(user2) |> translate_to_string})
	end

	def match(conn, %{"user1" => user1,"user2" => user2}) do
		conn
    |> put_status(200)
    |> json(%{matching: TwitterClient.match_friends(user1,user2) |> translate})
	end

	def generate_tgf(conn, %{"user1" => user1,"user2" => user2}) do
    data = user1
           |> TwitterClient.match_friends(user2)
           |> TwitterClient.mutual_friends_relation

		nodes = Enum.reduce(data.nodes, "", fn(x, acc) -> acc <> "#{x}" <> "\n" end)
		edges = Enum.reduce(data.relations, "", fn(x, acc) ->
			case x do
				{a,b} ->
					acc <> "#{a} #{b}" <> "\n"
				{a} ->
					acc <> "#{a}" <> "\n"
			end
		end)
		conn
      |> put_status(200)
      |> text(nodes <> "#" <> "\n" <> edges)
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
