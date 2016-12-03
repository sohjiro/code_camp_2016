defmodule CodeCamp2016.Router do
  use CodeCamp2016.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CodeCamp2016 do
    pipe_through :api
  end
end
