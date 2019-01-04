defmodule ZeusWeb.StepControllerTest do
  use ZeusWeb.ConnCase

  alias Zeus.Domain
  alias Zeus.Domain.Step

  @create_attrs %{
    params: %{},
    template_id: "some template_id"
  }
  @update_attrs %{
    params: %{},
    template_id: "some updated template_id"
  }
  @invalid_attrs %{params: nil, template_id: nil}

  def fixture(:step) do
    {:ok, step} = Domain.create_step(@create_attrs)
    step
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all steps", %{conn: conn} do
      conn = get(conn, Routes.step_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create step" do
    test "renders step when data is valid", %{conn: conn} do
      conn = post(conn, Routes.step_path(conn, :create), step: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.step_path(conn, :show, id))

      assert %{
               "id" => id,
               "params" => {},
               "template_id" => "some template_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.step_path(conn, :create), step: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update step" do
    setup [:create_step]

    test "renders step when data is valid", %{conn: conn, step: %Step{id: id} = step} do
      conn = put(conn, Routes.step_path(conn, :update, step), step: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.step_path(conn, :show, id))

      assert %{
               "id" => id,
               "params" => {},
               "template_id" => "some updated template_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, step: step} do
      conn = put(conn, Routes.step_path(conn, :update, step), step: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete step" do
    setup [:create_step]

    test "deletes chosen step", %{conn: conn, step: step} do
      conn = delete(conn, Routes.step_path(conn, :delete, step))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.step_path(conn, :show, step))
      end
    end
  end

  defp create_step(_) do
    step = fixture(:step)
    {:ok, step: step}
  end
end
