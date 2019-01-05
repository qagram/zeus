defmodule ZeusWeb.StepController do
  use ZeusWeb, :controller

  alias Zeus.Domain
  alias Zeus.Domain.Step

  action_fallback ZeusWeb.FallbackController

  def index(conn, _params) do
    steps = Domain.list_steps()
    render(conn, "index.json", steps: steps)
  end

  def create(conn, %{"step" => step_params, "test_id" => test_id}) do
    step_params = step_params |> Map.put("test_id", test_id)

    with {:ok, %Step{} = step} <- Domain.create_step(step_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.test_step_path(conn, :show, test_id, step))
      |> render("show.json", step: step)
    end
  end

  def show(conn, %{"id" => id}) do
    step = Domain.get_step!(id)
    render(conn, "show.json", step: step)
  end

  def update(conn, %{"id" => id, "step" => step_params}) do
    step = Domain.get_step!(id)

    with {:ok, %Step{} = step} <- Domain.update_step(step, step_params) do
      render(conn, "show.json", step: step)
    end
  end

  def delete(conn, %{"id" => id}) do
    step = Domain.get_step!(id)

    with {:ok, %Step{}} <- Domain.delete_step(step) do
      send_resp(conn, :no_content, "")
    end
  end
end
