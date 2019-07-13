defmodule HomepageApp.Repo do
  use Ecto.Repo,
    otp_app: :homepage_app,
    adapter: Ecto.Adapters.Postgres
end
