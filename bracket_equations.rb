module BracketEquations

  def self.simplify_string_equation(equation)
    return calculate_string_eq(equation).to_i unless equation.include? '('

    calculable = /\((\d+\ [\+\-]\ \d+|\d)\)/
    calcable_eq = equation.match(calculable).captures.first
    calculated_value = calculate_string_eq(calcable_eq)

    simpler_eq = equation.sub(calculable, calculate_string_eq(calcable_eq).to_s)

    simplify_string_equation(simpler_eq)
  end

  private

  def self.calculate_string_eq(equation)
    operators = {
      ' + ' => ->(a, b) {a.to_i + b.to_i},
      ' - ' => ->(a, b) {a.to_i - b.to_i}
    }

    operators.keys.each do |k|
      return operators[k].call(*equation.split(k)) if equation.include? k
    end

    equation
  end


end
