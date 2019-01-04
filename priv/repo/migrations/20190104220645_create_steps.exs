defmodule Zeus.Repo.Migrations.CreateSteps do
  use Ecto.Migration

  def change do
    create table(:steps) do
      add :template_id, :string
      add :params, :map

      timestamps()
    end

  end
end
