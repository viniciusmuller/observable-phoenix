import Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.

# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
config :observable_todolist, ObservableTodolistWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"

# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: ObservableTodolist.Finch

# Do not print debug messages in production
config :logger, 
  backends: [:console, LoggerExporter.Backend],
  level: :info

# TODO: figure out how to redact certain fields that are logged inside "params"
# config :phoenix, :filter_parameters, ["password", "secret"]

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.

config :observable_todolist, ObservableTodolist.PromEx,
  disabled: false,
  manual_metrics_start_delay: :no_delay,
  drop_metrics_groups: [],
  grafana: [
    host: "http://nginx:3000",
    username: "admin",
    password: "admin",
    upload_dashboards_on_start: true
  ],
  metrics_server: :disabled

config :opentelemetry, :resource, service: %{name: "observable-todolist"}

config :opentelemetry, :processors,
  otel_batch_processor: %{
    exporter: {
      :opentelemetry_exporter,
      %{endpoints: ["http://nginx:4318"]}
    }
  }
