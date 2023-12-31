def factorial(n: Int): Int = n match {
  case 0 => 1
  case x if x > 0 => factorial(n - 1) * n
  case x if x < 0 => factorial(n.abs)
}

println(factorial(3))
println(factorial(0))
println(factorial(-4))
