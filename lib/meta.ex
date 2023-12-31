defmodule Meta do
  @moduledoc """
  Documentation for `Meta`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Meta.hello()
      :world

  """
  use Using, [:name, ]

  def hello do
    :world
  end

  def callback_get(_num) do
    :callback
  end
end
