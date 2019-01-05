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
end
