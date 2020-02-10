defmodule Stack do
  def new, do: []

  def push([], value), do: [{value, value}]

  def push([{_, max} | _] = stack, value) do
    new_max = if value > max, do: value, else: max
    [{value, new_max} | stack]
  end

  def pop([]), do: :empty
  def pop([{value, _max} | rest_stack]), do: {value, rest_stack}

  def get_max([]), do: :empty
  def get_max([{_val, max} | _rest]), do: max
end

defmodule StackTest do
  use ExUnit.CaseTemplate

  assert Stack.new() == []
  assert Stack.new() |> Stack.pop() == :empty
  assert Stack.new() |> Stack.push(1) |> Stack.pop() == {1, []}

  {value, stack} =
    Stack.new()
    |> Stack.push(1)
    |> Stack.push(4)
    |> Stack.push(3)
    |> Stack.push(2)
    |> Stack.push(5)
    |> Stack.pop()

  assert value == 5
  assert Stack.get_max(stack) == 4
end
