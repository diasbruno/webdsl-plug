import Config

config :webdsl_plug, WebdslPlugWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "nEbG8dMRKm3nEbMsDAT+nk+DFLx3jshFJZAGrBxJX2u7R9eQS+eDPBH1AagEFmkB",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}
  ]

config :webdsl_plug, WebdslPlugWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/webdsl_plug_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :webdsl_plug, :swoosh_mailer, server: false

config :logger, level: :debug

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
