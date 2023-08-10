defmodule ExPVETest do
  use ExUnit.Case
  doctest ExPVE

  test "greets the world" do
    assert ExPVE.hello() == :world
  end
end
