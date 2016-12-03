use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :code_camp_2016, CodeCamp2016.Endpoint,
  http: [port: 4001],
  server: false

config :code_camp_2016, :twitter_api, CodeCamp2016.Twitter.InMemory

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
#config :code_camp_2016, CodeCamp2016.Repo,
#  adapter: Ecto.Adapters.Postgres,
#  username: "postgres",
#  password: "postgres",
#  database: "code_camp_2016_test",
#  hostname: "localhost",
#  pool: Ecto.Adapters.SQL.Sandbox
