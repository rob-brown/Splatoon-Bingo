import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :splatoon_bingo, SplatoonBingoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "8pKO0pe4qae+jd0HcNxAJdpwWBjNQKFZJPz2RoITP9wxQYciBC3FjxU644DC0HaL",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
