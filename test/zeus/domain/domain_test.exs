defmodule Zeus.DomainTest do
  use Zeus.DataCase

  alias Zeus.Domain

  describe "steps" do
    alias Zeus.Domain.Step

    @valid_attrs %{params: %{}, template_id: "some template_id"}
    @update_attrs %{params: %{}, template_id: "some updated template_id"}
    @invalid_attrs %{params: nil, template_id: nil}

    def step_fixture(attrs \\ %{}) do
      {:ok, step} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Domain.create_step()

      step
    end

    test "list_steps/0 returns all steps" do
      step = step_fixture()
      assert Domain.list_steps() == [step]
    end

    test "get_step!/1 returns the step with given id" do
      step = step_fixture()
      assert Domain.get_step!(step.id) == step
    end

    test "create_step/1 with valid data creates a step" do
      assert {:ok, %Step{} = step} = Domain.create_step(@valid_attrs)
      assert step.params == %{}
      assert step.template_id == "some template_id"
    end

    test "create_step/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Domain.create_step(@invalid_attrs)
    end

    test "update_step/2 with valid data updates the step" do
      step = step_fixture()
      assert {:ok, %Step{} = step} = Domain.update_step(step, @update_attrs)
      assert step.params == %{}
      assert step.template_id == "some updated template_id"
    end

    test "update_step/2 with invalid data returns error changeset" do
      step = step_fixture()
      assert {:error, %Ecto.Changeset{}} = Domain.update_step(step, @invalid_attrs)
      assert step == Domain.get_step!(step.id)
    end

    test "delete_step/1 deletes the step" do
      step = step_fixture()
      assert {:ok, %Step{}} = Domain.delete_step(step)
      assert_raise Ecto.NoResultsError, fn -> Domain.get_step!(step.id) end
    end

    test "change_step/1 returns a step changeset" do
      step = step_fixture()
      assert %Ecto.Changeset{} = Domain.change_step(step)
    end
  end
end
