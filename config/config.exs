# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :code_camp_2016,
  ecto_repos: [CodeCamp2016.Repo]

# Configures the endpoint
config :code_camp_2016, CodeCamp2016.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qa4sWqFPf7GJqNf2xjGm9Q3KgCkLvVhMi1xMQDbkehtmkTfCQQv+MjgqfnimfmtM",
  render_errors: [view: CodeCamp2016.ErrorView, accepts: ~w(json)],
  pubsub: [name: CodeCamp2016.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
