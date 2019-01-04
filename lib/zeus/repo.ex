defmodule Zeus.Repo do
  use Ecto.Repo,
    otp_app: :zeus,
    adapter: Ecto.Adapters.Postgres
end
