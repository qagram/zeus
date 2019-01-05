# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :zeus,
  ecto_repos: [Zeus.Repo]

# Configures the endpoint
config :zeus, ZeusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kZhWorMuLCWPqTKPLZW2Iqm0K8ya6apJ8NeZjNEMeXTHrZ40Cslp45x7MO1wML+z",
  render_errors: [view: ZeusWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Zeus.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Hound configuration
config :hound,
  driver: "chrome_driver"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
