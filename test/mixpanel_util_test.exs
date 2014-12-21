defmodule MixpanelUtilTest do
  use ExUnit.Case

  test "adding no timestamp to properties" do
    properties = [foo: "bar"]
    assert Mixpanel.Util.add_timestamp(properties, nil) == properties
  end

  test "adds int timestamps as the :time key" do
    properties = [foo: "bar"]
    assert Mixpanel.Util.add_timestamp(properties, 123)
              == [time: 123, foo: "bar"]
  end

  test "adds :timer.now() tuple time" do
    properties = [foo: "bar"]
    assert Mixpanel.Util.add_timestamp(properties, {1, 3000, 10})
              == [time: 13000, foo: "bar"]
  end

  test "crashes when timestamp is neither nil nor an int" do
    fun = fn -> Mixpanel.Util.add_timestamp([], "not a timestamp") end
    assert_raise FunctionClauseError, fun
  end

end

