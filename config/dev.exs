use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :teaching_school, TeachingSchool.Endpoint,
  http: [port: 5000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :teaching_school, TeachingSchool.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :teaching_school, TeachingSchool.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "teaching_school_dev",
  hostname: "localhost",
  pool_size: 10

  [{TeachingSchool.Endpoint, [url: [host: "localhost"], secret_key_base: "rOQsqNsfHAKTodToBUJ2rguoMjpoR76/aq2632S8htOqqqoyv0sRkou0tbGO2ihr", render_errors: [view: TeachingSchool.ErrorView, accepts: ["html", "json"]], pubsub: [name: TeachingSchool.PubSub, adapter: Phoenix.PubSub.PG2], http: [port: 5000], debug_errors: true, code_reloader: true, dev?: true, check_origin: false, watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin", {:cd, "/home/dee/Programming/elixir/shropshire-teaching-school"}]], live_reload: [patterns: [~r/priv\/static\/.*(js|css|png|jpeg|jpg|gif|svg)$/, ~r/priv\/gettext\/.*(po)$/, ~r/web\/views\/.*(ex)$/, ~r/web\/templates\/.*(eex)$/]]]}, {TeachingSchool.Repo, [adapter: Ecto.Adapters.Postgres, username: "postgres", password: "postgres", database: "teaching_school_dev", hostname: "localhost", pool_size: 10]}, {:included_applications, []}, {:ecto_repos, [TeachingSchool.Repo]}]
