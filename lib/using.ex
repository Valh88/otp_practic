defmodule Using do

  @callback callback_get(integer()) :: :callback

  defmacro __using__(state) do
    quote do
      @behaviour Using

      defstruct unquote(state)

      def get(num), do: Using.get(__MODULE__, num)

      def using_struct(map) do
        struct(__MODULE__, map)
      end
    end
  end

  def get(module, num) do
    module.callback_get(num)
  end
end
