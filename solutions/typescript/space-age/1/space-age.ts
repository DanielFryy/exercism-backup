export const PERIODS = {
  mercury: 0.2408467,
  venus: 0.61519726,
  earth: 1,
  mars: 1.8808158,
  jupiter: 11.862615,
  saturn: 29.447498,
  uranus: 84.016846,
  neptune: 164.79132
} as const;

export const yearInSeconds = 365.25 * 24 * 60 * 60;

export function age(planet: keyof typeof PERIODS, seconds: number): number {
  const period = PERIODS[planet];
  const earthlyAge = seconds / yearInSeconds;
  const outerAge = earthlyAge / period;
  return +outerAge.toFixed(2);
}
