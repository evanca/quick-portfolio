// Copies the pinned Sveltia CMS bundle from node_modules into public/admin so
// the CMS is served from this site (no third-party CDN) and its version is
// controlled by package-lock.json. Runs as the `prebuild` npm script.
import { copyFileSync, mkdirSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const root = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const src = resolve(root, "node_modules/@sveltia/cms/dist/sveltia-cms.js");
const dest = resolve(root, "public/admin/sveltia-cms.js");

mkdirSync(dirname(dest), { recursive: true });
copyFileSync(src, dest);
console.log(`copied ${src} -> ${dest}`);
