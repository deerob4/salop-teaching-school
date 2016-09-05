# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :teaching_school,
  ecto_repos: [TeachingSchool.Repo]

# Configures the endpoint
config :teaching_school, TeachingSchool.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rOQsqNsfHAKTodToBUJ2rguoMjpoR76/aq2632S8htOqqqoyv0sRkou0tbGO2ihr",
  render_errors: [view: TeachingSchool.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TeachingSchool.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
