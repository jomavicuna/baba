import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const notes = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/notes' }),
  schema: z.object({
    title: z.string().optional(),
    tags: z.array(z.string()).optional(),
    created: z.date().optional(),
    updated: z.date().optional(),
  }),
});

export const collections = { notes };
