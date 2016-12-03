defmodule CodeCamp2016.FollowersController do
	use CodeCamp2016.Web, :controller

	def show(conn, params) do
		conn
      |> put_status(200)
      |> json (%{user1: ["Misa","Pedro","Jose"],
      	         user2: ["Machinesaurus","Chochos","Peter","Testing"]})
	end
end