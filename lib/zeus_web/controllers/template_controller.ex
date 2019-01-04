defmodule ZeusWeb.TemplateController do
  use ZeusWeb, :controller

  alias Zeus.Domain
  alias Zeus.Domain.Template

  action_fallback ZeusWeb.FallbackController

  def index(conn, _params) do
    templates = [
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
    json conn, templates
  end
end
