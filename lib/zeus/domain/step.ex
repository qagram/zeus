defmodule Zeus.Domain.Step do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "steps" do
    field :params, :map
    field :template_id, :string

    timestamps()
  end

  @doc false
  def changeset(step, attrs) do
    step
    |> cast(attrs, [:template_id, :params])
    |> validate_required([:template_id, :params])
  end
end
