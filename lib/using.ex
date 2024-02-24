defmodule Using do

  @callback callback_get(integer() | float()) :: :callback
  @optional_callbacks callback_get: 1

  defmacro __using__(state) do
    quote do
      import Using
      @behaviour Using

      defstruct unquote(state)

      def get(num) do
        Using.get(__MODULE__, num)
      end

      def using_struct(map) do
        struct(__MODULE__, map)
      end

      info(unquote(state))
    end
  end

  @spec get(atom(), any()) :: any()
  def get(module, num) do

    if Keyword.has_key?(module.__info__(:functions), :callback_get) do
      module.callback_get(num)
    end
  end

  def info(data) do
    IO.inspect(data)
  end

  @spec exemple_macro(any()) ::
          {:if, [{:context, Using} | {:do, [...]} | {:end, [...]} | {:imports, [...]}, ...],
           [[{any(), any()}, ...] | {:is_float, [...], [...]}, ...]}
  defmacro exemple_macro(exemple) do
    quote do
      if is_float(unquote(exemple)) do
        IO.inspect("its fload")
      else
        raise ArgumentError, "need float"
      end
    end
  end
end
