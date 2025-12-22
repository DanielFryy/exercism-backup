const DNA_TO_RNA: Record<string, string> = { A: 'U', C: 'G', G: 'C', T: 'A' };

export function toRna(strand: string) {
  if (/[^ACGT]/.test(strand)) throw new Error('Invalid input DNA.');

  return strand.replace(/[ACGT]/g, (nucleotide) => DNA_TO_RNA[nucleotide]);
}
