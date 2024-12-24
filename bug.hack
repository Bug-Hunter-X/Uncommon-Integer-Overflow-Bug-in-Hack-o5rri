function foo(x: int): int {
  return x + 1;
}

function bar(x: int): int {
  return foo(x) * 2;
}

function baz(x: int): int {
  return bar(x) - 1;
}

function main(): void {
  var x = 5;
  var y = baz(x);
  print(y);
}

// This code compiles and runs correctly. However, it will produce an unexpected
// result when x is larger than INT_MAX/2 - 1 or smaller than INT_MIN/2 + 1.
// This is because the intermediate result of foo(x) + 1 can cause an integer overflow.
// The solution is to handle potential integer overflow scenarios using techniques
// like using larger integer types or checking for overflow conditions before
// performing arithmetic operations.  This shows the subtlety and unexpectedness of
// the error, making it uncommon.