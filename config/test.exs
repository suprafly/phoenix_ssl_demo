import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_ssl_demo, PhoenixSslDemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Dh51OlTovrFcZwyZwBba3I5QWnnpGDbh3cl6gMK3Jc0Fp7wAM/WnLVRJHqasZ6r7",
  server: false

# In test we don't send emails.
config :phoenix_ssl_demo, PhoenixSslDemo.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
