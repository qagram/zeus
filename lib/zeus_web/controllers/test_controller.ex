defmodule ZeusWeb.TestController do
  use ZeusWeb, :controller
  use Hound.Helpers

  alias Zeus.Domain
  alias Zeus.Domain.Test

  action_fallback ZeusWeb.FallbackController

  def index(conn, _params) do
    tests = Domain.list_tests()
    render(conn, "index.json", tests: tests)
  end

  def create(conn, %{"test" => test_params}) do
    with {:ok, %Test{} = test} <- Domain.create_test(test_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.test_path(conn, :show, test))
      |> render("show.json", test: test)
    end
  end

  def show(conn, %{"id" => id}) do
    test = Domain.get_test!(id)
    render(conn, "show.json", test: test)
  end

  def update(conn, %{"id" => id, "test" => test_params}) do
    test = Domain.get_test!(id)

    with {:ok, %Test{} = test} <- Domain.update_test(test, test_params) do
      render(conn, "show.json", test: test)
    end
  end

  def delete(conn, %{"id" => id}) do
    test = Domain.get_test!(id)

    with {:ok, %Test{}} <- Domain.delete_test(test) do
      send_resp(conn, :no_content, "")
    end
  end

  def run(conn, _params) do
    Hound.start_session(browser: "phantomjs")

    navigate_to "http://example.org"

    json conn, %{data: %{ page_title: page_title, source: page_source }}
  end

  defp setup(config) do
  end

  defp on_exit(param) do
  end
end
