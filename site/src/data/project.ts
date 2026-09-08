import { type CollectionEntry, getCollection } from "astro:content";

/** All projects, drafts hidden in production, sorted by `order` then newest first. */
export async function getAllProjects(): Promise<CollectionEntry<"project">[]> {
	const projects = await getCollection("project", ({ data }) => {
		return import.meta.env.PROD ? !data.draft : true;
	});
	return projects.sort(
		(a, b) => a.data.order - b.data.order || b.data.date.getTime() - a.data.date.getTime(),
	);
}

/** Work history, most recent role first (by `order`). */
export async function getWorkHistory(): Promise<CollectionEntry<"work">[]> {
	const entries = await getCollection("work");
	return entries.sort((a, b) => a.data.order - b.data.order);
}
