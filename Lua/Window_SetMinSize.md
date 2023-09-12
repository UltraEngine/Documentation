```cpp
/**
 * @class Calculator
 * @brief Performs basic arithmetic operations
 *
 * This class provides methods for performing
 * basic arithmetic operations such as addition,
 * subtraction, multiplication, and division.
 */
class Calculator {
public:
  /**
   * @brief Adds two numbers
   * @param a The first number
   * @param b The second number
   * @return The sum of a and b
   */
  int add(int a, int b) {
    return a + b;
  }

  /**
   * @brief Subtracts two numbers
   * @param a The first number
   * @param b The second number
   * @return The difference of a and b
   */
  int subtract(int a, int b) {
    return a - b;
  }

  /**
   * @brief Multiplies two numbers
   * @param a The first number
   * @param b The second number
   * @return The product of a and b
   */
  int multiply(int a, int b) {
    return a * b;
  }

  /**
   * @brief Divides two numbers
   * @param a The first number
   * @param b The second number
   * @return The quotient of a and b
   * @throw std::invalid_argument If b is zero
   */
  double divide(int a, int b) {
    if (b == 0) {
      throw std::invalid_argument("Division by zero");
    }
    return static_cast<double>(a) / static_cast<double>(b);
  }
};
```

```cpp
// Example usage

#include <iostream>

int main() {
  Calculator calculator;
  int sum = calculator.add(5, 3);
  std::cout << "Sum: " << sum << std::endl;

  int difference = calculator.subtract(5, 3);
  std::cout << "Difference: " << difference << std::endl;

  int product = calculator.multiply(5, 3);
  std::cout << "Product: " << product << std::endl;

  double quotient = calculator.divide(5, 3);
  std::cout << "Quotient: " << quotient << std::endl;

  try {
    quotient = calculator.divide(5, 0);
    std::cout << "Quotient: " << quotient << std::endl;
  } catch (const std::exception& e) {
    std::cout << "Error: " << e.what() << std::endl;
  }

  return 0;
}
```

```lua
--@class Calculator
--@brief Performs basic arithmetic operations
--
--This class provides methods for performing
--basic arithmetic operations such as addition,
--subtraction, multiplication, and division.
Calculator = {}

--@brief Adds two numbers
--@param a The first number
--@param b The second number
--@return The sum of a and b
function Calculator:add(a, b)
  return a + b
end

--@brief Subtracts two numbers
--@param a The first number
--@param b The second number
--@return The difference of a and b
function Calculator:subtract(a, b)
  return a - b
end

--@brief Multiplies two numbers
--@param a The first number
--@param b The second number
--@return The product of a and b
function Calculator:multiply(a, b)
  return a * b
end

--@brief Divides two numbers
--@param a The first number
--@param b The second number
--@return The quotient of a and b
--@throw If b is zero
function Calculator:divide(a, b)
  if b == 0 then
    error("Division by zero")
  end
  return a / b
end

-- Example usage

calculator = Calculator
sum = calculator:add(5, 3)
print("Sum: " .. sum)

difference = calculator:subtract(5, 3)
print("Difference: " .. difference)

product = calculator:multiply(5, 3)
print("Product: " .. product)

quotient = calculator:divide(5, 3)
print("Quotient: " .. quotient)

ok, err = pcall(function() 
  quotient = calculator:divide(5, 0)
  print("Quotient: " .. quotient)
end)
if not ok then
  print("Error: " .. err)
end
```