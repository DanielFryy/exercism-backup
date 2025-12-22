export function isLeap(year: number) {
  const isDivisibleBy4 = !(year % 4);
  const isDivisibleBy100 = !(year % 100);
  const isDivisibleBy400 = !(year % 400);

  return isDivisibleBy4 && (!isDivisibleBy100 || isDivisibleBy400);
}
