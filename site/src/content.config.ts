import { defineCollection } from "astro:content";
import { glob } from "astro/loaders";
import { z } from "astro/zod";

// Every collection below is also declared in public/admin/config.yml (Sveltia
// CMS). Keep the two in sync: the CMS writes the frontmatter, this file
// validates it at build time.

function removeDupsAndLowerCase(array: string[]) {
	return [...new Set(array.map((str) => str.toLowerCase()))];
}

const titleSchema = z.string().max(80);

// Images referenced from the CMS live under public/images (uploads go to
// public/images/uploads), so they are plain paths rather than Astro assets.
const imageSchema = z.object({
	src: z.string(),
	alt: z.string().default(""),
});

const dateSchema = z
	.string()
	.or(z.date())
	.transform((val) => new Date(val));

const optionalDateSchema = z
	.string()
	.or(z.date())
	.optional()
	.transform((val) => (val ? new Date(val) : undefined));

const post = defineCollection({
	loader: glob({ base: "./content/posts", pattern: "**/*.{md,mdx}" }),
	schema: z.object({
		title: titleSchema,
		description: z.string(),
		publishDate: dateSchema,
		updatedDate: optionalDateSchema,
		tags: z.array(z.string()).default([]).transform(removeDupsAndLowerCase),
		coverImage: imageSchema.optional(),
		ogImage: z.string().optional(),
		draft: z.boolean().default(false),
		pinned: z.boolean().default(false),
	}),
});

const project = defineCollection({
	loader: glob({ base: "./content/projects", pattern: "**/*.{md,mdx}" }),
	schema: z.object({
		title: titleSchema,
		description: z.string(),
		// Year (or full date) the project started; shown on the card.
		date: dateSchema,
		tags: z.array(z.string()).default([]).transform(removeDupsAndLowerCase),
		thumbnail: imageSchema.optional(),
		// External links shown on the card and the project page.
		url: z.string().url().optional(),
		repo: z.string().url().optional(),
		featured: z.boolean().default(false),
		// Lower sorts first on the projects page and the homepage.
		order: z.number().default(100),
		draft: z.boolean().default(false),
	}),
});

const work = defineCollection({
	loader: glob({ base: "./content/work", pattern: "**/*.{md,mdx}" }),
	schema: z.object({
		company: z.string(),
		role: z.string(),
		// Free text so "2018" and "Jan 2023" both work; end is "Present" for the current role.
		start: z.string(),
		end: z.string().default("Present"),
		summary: z.string(),
		skills: z.array(z.string()).default([]),
		url: z.string().url().optional(),
		// Lower sorts first (most recent role first).
		order: z.number().default(100),
	}),
});

// Singletons edited as "file collections" in the CMS: home, about, legal pages.
const page = defineCollection({
	loader: glob({ base: "./content/pages", pattern: "**/*.{md,mdx}" }),
	schema: z.object({
		title: titleSchema,
		description: z.string().optional(),
		// Home only: the one-line greeting above the intro paragraph.
		greeting: z.string().optional(),
		updatedDate: optionalDateSchema,
	}),
});

const tag = defineCollection({
	loader: glob({ base: "./content/tags", pattern: "**/*.{md,mdx}" }),
	schema: z.object({
		title: titleSchema.optional(),
		description: z.string().optional(),
	}),
});

export const collections = { post, project, work, page, tag };
