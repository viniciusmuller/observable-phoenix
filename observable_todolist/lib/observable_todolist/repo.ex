defmodule ObservableTodolist.Repo do
  use Ecto.Repo,
    otp_app: :observable_todolist,
    adapter: Ecto.Adapters.Postgres
end
