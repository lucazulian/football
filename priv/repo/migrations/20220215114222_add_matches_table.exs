defmodule Football.Repo.Migrations.AddMatchesTable do
  use Ecto.Migration

  def change do
    create table(:matches, primary_key: false) do
      add :id, :uuid, primary_key: true

      timestamps(type: :naive_datetime_usec)
    end
  end
end
