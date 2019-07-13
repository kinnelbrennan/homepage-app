# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :homepage_app,
  ecto_repos: [HomepageApp.Repo]

# Configures the endpoint
config :homepage_app, HomepageAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nTe92qzbae1cnoCe+suVW5Og46ohBfadFD3dyGyGK4pOA84fLTuAZiR6etuUJZRU",
  render_errors: [view: HomepageAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HomepageApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
