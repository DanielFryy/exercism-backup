export function decodedValue(colors: string[]) {
  const [color1, color2] = colors;
  const code1 = COLORS.indexOf(color1);
  const code2 = COLORS.indexOf(color2);
  return +`${code1}${code2}`;
};

export const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
];
