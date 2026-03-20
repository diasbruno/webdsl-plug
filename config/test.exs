import Config

config :webdsl_plug, WebdslPlugWeb.Endpoint, server: false

config :logger, level: :warning

config :phoenix, :plug_init_mode, :runtime
