import type { AstroExpressiveCodeOptions } from "astro-expressive-code";
import type { SiteConfig } from "@/types";

export const siteConfig: SiteConfig = {
	// Also passed to astro.config.ts as `site`; drives canonical URLs, the
	// sitemap and RSS links.
	url: "https://thomasjbarlow.com/",
	title: "Thomas Barlow",
	author: "Thomas Barlow",
	description:
		"Software engineer building backend systems, web platforms and the occasional 3D-printed hardware project.",
	lang: "en-US",
	ogLocale: "en_US",
	// Cloudflare Web Analytics beacon token (dashboard: Analytics & Logs -> Web
	// Analytics -> the site -> JS snippet, the `token` value). Empty disables it.
	cloudflareAnalyticsToken: "dae0dc970f6b432dbc6d25f7ff33f7a6",
	date: {
		options: {
			day: "numeric",
			month: "short",
			year: "numeric",
		},
	},
};

// Header and footer navigation, in order.
export const menuLinks: { path: string; title: string }[] = [
	{ path: "/posts/", title: "Blog" },
	{ path: "/projects/", title: "Projects" },
	{ path: "/work/", title: "Work" },
	{ path: "/about/", title: "About" },
];

export const socialLinks: { friendlyName: string; link: string; name: string }[] = [
	{ friendlyName: "GitHub", link: "https://github.com/barlowtj48", name: "mdi:github" },
	{
		friendlyName: "LinkedIn",
		link: "https://www.linkedin.com/in/thomas-barlow/",
		name: "mdi:linkedin",
	},
	{ friendlyName: "YouTube", link: "https://www.youtube.com/c/thomasbarlow", name: "mdi:youtube" },
	{ friendlyName: "Email", link: "mailto:contact@thomasjbarlow.com", name: "mdi:email-outline" },
	{ friendlyName: "RSS", link: "/rss.xml", name: "mdi:rss" },
];

// https://expressive-code.com/reference/configuration/
export const expressiveCodeOptions: AstroExpressiveCodeOptions = {
	styleOverrides: {
		borderRadius: "6px",
		codeFontFamily:
			'ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace',
		codeFontSize: "0.875rem",
		codeLineHeight: "1.7142857rem",
		codePaddingInline: "1rem",
		frames: {
			frameBoxShadowCssValue: "none",
		},
		uiLineHeight: "inherit",
	},
	themeCssSelector(theme, { styleVariants }) {
		if (styleVariants.length >= 2) {
			const baseTheme = styleVariants[0]?.theme;
			const altTheme = styleVariants.find((v) => v.theme.type !== baseTheme?.type)?.theme;
			if (theme === baseTheme || theme === altTheme) return `[data-theme='${theme.type}']`;
		}
		return `[data-theme="${theme.name}"]`;
	},
	themes: ["github-dark", "github-light"],
	useThemedScrollbars: false,
};
