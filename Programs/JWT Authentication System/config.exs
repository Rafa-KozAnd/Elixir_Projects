config :my_app, MyAppWeb.Guardian,
  issuer: "MyAppWeb",
  secret_key: "your_secret_key",  # substitua por uma chave secreta forte e segura
  ttl: {30, :days}  # tempo de vida do token JWT
