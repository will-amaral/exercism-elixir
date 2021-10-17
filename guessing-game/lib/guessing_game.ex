defmodule GuessingGame do
  def compare(secret, guess \\ :no_guess)
  def compare(secret, guess) when secret == guess, do: "Correct"
  def compare(_, guess) when guess == :no_guess, do: "Make a guess"
  def compare(secret, guess) when secret == guess - 1 or secret == guess + 1, do: "So close"
  def compare(secret, guess) when secret < guess, do: "Too high"
  def compare(secret, guess) when secret > guess, do: "Too low"
end
