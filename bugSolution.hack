function foo(x: int): int {
  // Check for potential overflow before adding 1
  if (x > 2147483646) { //Check if adding one will result in overflow
    return 2147483647; //Return max int
  }
  if (x < -2147483647) { //Check if adding one will result in overflow
    return -2147483648; //Return min int
  }
  return x + 1;
}

function bar(x: int): int {
  // Check for potential overflow before multiplying by 2
  if (x > 1073741823 || x < -1073741824){
    return 0; //Handle potential overflow
  }
  return foo(x) * 2;
}

function baz(x: int): int {
  // Check for potential overflow before subtracting 1
  if (bar(x) == 2147483647){
    return 2147483647;
  }
  return bar(x) - 1;
}

function main(): void {
  var x = 5;
  var y = baz(x);
  print(y);
}
//This solution adds checks for potential integer overflow in each function to prevent unexpected results.