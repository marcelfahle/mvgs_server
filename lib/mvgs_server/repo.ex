defmodule MvgsServer.Repo do
  use Ecto.Repo,
    otp_app: :mvgs_server,
    adapter: Ecto.Adapters.Postgres
end
