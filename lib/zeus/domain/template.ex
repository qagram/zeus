defmodule Zeus.Domain.Template do

  @doc """
  Gets a list of available templates.

  ## Examples

      iex> list()
      [%Template{}]
  """
  def list do
    [
      %{
        id: "visit_url",
        label: "I visit :url",
        params: [
          %{
            name: :url,
            type: :string
          }
        ]
      },
      %{
        id: "fill_form_input",
        label: "I fill :name input with :value value",
        params: [
          %{
            name: :name,
            type: :string
          },
          %{
            name: :value,
            type: :string
          }
        ]
      }
    ]
  end

  @doc """
  Gets a list of available template keys.

  ## Examples

      iex> available_keys()
      ["visit_url", "fill_form_input"]
  """
  def available_keys do
    list
    |> Enum.map(fn t-> t[:id] end)
  end

  def find(template_id) do
    Zeus.Domain.Template.list
    |> Enum.find(fn t ->  t[:id] == template_id end)
  end
end
