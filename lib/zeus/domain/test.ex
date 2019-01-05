defmodule Zeus.Domain.Test do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "tests" do
    field :name, :string
    has_many :steps, Zeus.Domain.Step

    timestamps()
  end

  @doc false
  def changeset(test, attrs) do
    test
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
