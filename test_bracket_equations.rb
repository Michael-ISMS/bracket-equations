require 'minitest/autorun'
require_relative 'bracket_equations'

class TestBraketEquations < Minitest::Test
  def test_that_simplify_string_equations_can_add_strings_with_no_brakets
    assert_equal BracketEquations.simplify_string_equation("2 + 1"), 3
  end

  def test_that_simplify_string_equations_can_subtract_strings_with_no_brakets
    assert_equal BracketEquations.simplify_string_equation("2 - 1"), 1
  end

  def test_that_simplify_string_equations_can_add_strings_with_brakets
    assert_equal BracketEquations.simplify_string_equation("(2 + 1)"), 3
  end

  def test_that_simplify_string_equations_can_subtract_strings_with_brakets
    assert_equal BracketEquations.simplify_string_equation("(2 - 1)"), 1
  end

  def test_that_simplify_string_equations_can_simplify_redundant_brackets
    assert_equal BracketEquations.simplify_string_equation("(((((2 + 1)))))"), 3
  end

  def test_that_simplify_string_equations_can_operate_on_multiple_braketed_objects
    assert_equal BracketEquations.simplify_string_equation("(2 + 1) + (9 - 7)"), 5
  end

  def test_that_simplify_string_equations_can_add_brakets_with_zero
    assert_equal BracketEquations.simplify_string_equation("(2 + 0)"), 2
  end

  def test_that_simplify_string_equations_can_add_brakets_with_multiple_zeros
    assert_equal BracketEquations.simplify_string_equation("(0 + 0) + (0 - 0)"), 0
  end
end
