import Config

config :webdsl_plug, WebdslPlugWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"

config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: WebdslPlug.Finch

config :logger, level: :info

config :logger, :console, format: "[$level] $message\n"
