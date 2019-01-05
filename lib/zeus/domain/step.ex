defmodule Zeus.Domain.Step do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "steps" do
    field :params, :map
    field :template_id, :string
    belongs_to :test, Test, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(step, attrs) do
    step
    |> cast(attrs, [:template_id, :params, :test_id])
    |> validate_required([:template_id, :params, :test_id])
    |> validate_inclusion(:template_id, Zeus.Domain.Template.available_keys)
    |> validate_completeness()
    |> assoc_constraint(:test)
  end

  defp validate_completeness(changeset) do
    if match_template_params?(changeset) do
      changeset
    else
      add_error changeset, :params, "Provided step params does not match template params set."
    end
  end

  defp match_template_params?(changeset) do
    if Map.has_key?(changeset.changes, :params) do
      template_keys = Zeus.Domain.Template.find(changeset.data.template_id)
      |> Map.get(:params)
      |> Enum.map(fn p -> Atom.to_string(p[:name]) end)

      step_keys = changeset.changes.params |> Map.keys

      missing_params = template_keys -- step_keys
      extra_params = step_keys -- template_keys

      missing_params |> Enum.empty? && extra_params |> Enum.empty?
    else
      true
    end
  end
end
