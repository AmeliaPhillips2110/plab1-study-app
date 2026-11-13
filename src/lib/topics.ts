/** Display topics alphabetically by name everywhere in the UI. */
export function sortTopicsByName<T extends { name: string }>(topics: T[]): T[] {
  return [...topics].sort((a, b) =>
    a.name.localeCompare(b.name, undefined, { sensitivity: 'base' }),
  )
}
