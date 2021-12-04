require_relative 'test_helper'

class CanalTest < Minitest::Test
  def test_identity
    f = canal
    value = Object.new

    assert_equal(value.object_id, f.(value).object_id)
  end

  def test_hash
    f = canal[:foo]
    value = { foo: :bar }

    assert_equal(:bar, f.(value))
  end

  def test_operators
    operators = %w(+ - * / % ** == === != < > <= >=)

    operators.each do |operator|
      a = 123
      b = 65

      assert_equal(a.send(operator, b), canal.send(operator, b).(a))
    end
  end

  def test_immutability
    f = canal[:foo]
    g = f[:bar]

    assert_equal(123, f.({ foo: 123 }))
    assert_equal(456, g.({ foo: { bar: 456 } }))
    refute_equal(f.object_id, g.object_id)
  end
end
