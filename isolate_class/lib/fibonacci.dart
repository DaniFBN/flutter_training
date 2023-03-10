BigInt fibonacci(BigInt n) {
  if (n <= BigInt.from(2)) return BigInt.one;
  return fibonacci(n - BigInt.one) + fibonacci(n - BigInt.two);
}