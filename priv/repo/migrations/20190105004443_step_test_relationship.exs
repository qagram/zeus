defmodule Zeus.Repo.Migrations.StepTestRelationship do
  use Ecto.Migration

  def change do
    alter table(:steps) do
      add :test_id, references(:tests, on_delete: :delete_all, type: :uuid), null: false
    end
  end
end
