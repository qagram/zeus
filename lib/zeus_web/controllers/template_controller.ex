defmodule ZeusWeb.TemplateController do
  use ZeusWeb, :controller

  alias Zeus.Domain
  alias Zeus.Domain.Template

  action_fallback ZeusWeb.FallbackController

  def index(conn, _params) do
    json conn, %{data: Template.list}
  end
end
