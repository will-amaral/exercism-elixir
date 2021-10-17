defmodule TakeANumber do
  def start() do
    spawn(fn -> loop() end)
  end

  def loop(state \\ 0) do
    receive do
      {:report_state, parent} ->
        send(parent, state)
        loop(state)
      {:take_a_number, parent} ->
        send(parent, state + 1)
        loop(state + 1)
      :stop -> :stopped
      _ -> loop(state)
    end
  end
end
