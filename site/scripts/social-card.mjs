// Regenerates public/social-card.png (the default Open Graph image). Run: node scripts/social-card.mjs
import sharp from "sharp";

const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630">
  <rect width="1200" height="630" fill="#1a1d24"/>
  <rect x="0" y="600" width="1200" height="30" fill="#2563eb"/>
  <rect x="80" y="120" width="96" height="96" rx="20" fill="#2563eb"/>
  <text x="128" y="186" text-anchor="middle" font-family="Segoe UI, Helvetica, Arial, sans-serif" font-size="50" font-weight="700" fill="#ffffff">TB</text>
  <text x="80" y="330" font-family="Segoe UI, Helvetica, Arial, sans-serif" font-size="84" font-weight="700" fill="#ffffff">Thomas Barlow</text>
  <text x="80" y="410" font-family="Segoe UI, Helvetica, Arial, sans-serif" font-size="36" fill="#c9cacc">Software engineer. Backend systems, web platforms,</text>
  <text x="80" y="460" font-family="Segoe UI, Helvetica, Arial, sans-serif" font-size="36" fill="#c9cacc">and the occasional 3D-printed hardware project.</text>
  <text x="80" y="560" font-family="Segoe UI, Helvetica, Arial, sans-serif" font-size="30" fill="#4f8ef7">thomasjbarlow.com</text>
</svg>`;
await sharp(Buffer.from(svg)).png().toFile("public/social-card.png");
console.log("wrote public/social-card.png");
