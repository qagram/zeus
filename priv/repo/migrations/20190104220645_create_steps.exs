defmodule Zeus.Repo.Migrations.CreateSteps do
  use Ecto.Migration

  def change do
    create table(:steps, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :template_id, :string
      add :params, :map

      timestamps()
    end

  end
end
