use Mix.Config

# Configure your database
config :learn_phoenix, LearnPhoenix.Repo,
  username: "postgres",
  password: "postgres",
  database: "learn_phoenix_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :learn_phoenix, LearnPhoenixWeb.Endpoint,
  http: [port: 4002],
  server: true

config :hound, driver: "phantomjs"

# Print only warnings and errors during test
config :logger, level: :warn
