# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sea_evercam_weed,
  ecto_repos: [SeaEvercamWeed.Repo]

# Configures the endpoint
config :sea_evercam_weed, SeaEvercamWeed.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BrlENI/gzUCFJEYaHePx1hGBZ+9SeA5J4ehqieuEigXU7bkd/gyiibFYfve/jafX",
  render_errors: [view: SeaEvercamWeed.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SeaEvercamWeed.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
