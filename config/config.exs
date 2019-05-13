# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :learn_phoenix,
  ecto_repos: [LearnPhoenix.Repo]

# Configures the endpoint
config :learn_phoenix, LearnPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8d6v5ixk3yCjOJkgjqNXhgH5xWecnmr6+ZOUElb9B+/8FQ8Z8N/mjMyS2kTl2GMm",
  render_errors: [view: LearnPhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LearnPhoenix.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
