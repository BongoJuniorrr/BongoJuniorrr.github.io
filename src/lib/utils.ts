import profile from '../data/profile.json';

/** Render an author list, bolding the site owner's name (any variant in profile.name_variants). */
export function formatAuthors(authors: string[]): string {
  const variants = new Set(profile.name_variants.map((v) => v.toLowerCase()));
  return authors
    .map((a) => (variants.has(a.trim().toLowerCase()) ? `<strong>${a}</strong>` : a))
    .join(', ');
}

/** "2026-07" or a Date → "Jul 2026"; full dates → "Jul 17, 2026". */
export function formatDate(input: string | Date): string {
  if (input instanceof Date) {
    return input.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
  }
  const [y, m] = input.split('-').map(Number);
  if (!y) return input;
  if (!m) return String(y);
  return new Date(y, m - 1).toLocaleDateString('en-US', { year: 'numeric', month: 'short' });
}
