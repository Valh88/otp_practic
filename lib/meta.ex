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

  def callback_get(num) do
    exemple_macro(num)
    IO.inspect(num)
    :callback
  end
end
