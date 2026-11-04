// The project index: builds the rows from PROJECTS, filters them, and drives the
// preview image that follows the cursor.
import { PROJECTS } from './projects-data.js';
import { $, $$, clamp, lerp, onFrame, fine, reduced, revealOnView } from './utils.js';
import { split } from './split.js';
import { pointer } from './cursor.js';

// Which field each project belongs to, used only for the filter chips.
export const FIELDS = {
  condeixa: ['web', 'xr'],
  pacheca: ['xr'],
  nb: ['xr'],
  spy: ['xr', 'games'],
  bake: ['xr', 'games'],
  'creative-learning': ['web']
};
const FILTERS = [['all', 'All'], ['web', 'Web'], ['xr', 'XR'], ['games', 'Games']];

const pad2 = n => String(n).padStart(2, '0');

export function initWorks(openProject) {
  const list = $('#list');
  const filters = $('#filters');
  const count = $('#work-count');

  list.innerHTML = PROJECTS.map((p, i) => `
    <li class="item" data-id="${p.id}" data-fields="${FIELDS[p.id].join(' ')}"><div class="item__in">
      <a class="row" href="#project-${p.id}" data-cursor="${fine ? 'view' : ''}" data-cursor-label="View" aria-label="${p.title}, ${p.year}. Open project">
        <span class="row__n" aria-hidden="true">${pad2(i + 1)}</span>
        <h3 class="row__t" data-split data-reveal>${p.title}</h3>
        <span class="row__meta">
          ${p.tags.slice(0, 3).map(t => `<span class="row__tag">${t}</span>`).join('')}
          <span class="row__y">${p.year}</span>
        </span>
        <img class="row__thumb" src="${p.gallery[0].src.replace(/[^/]+$/, 'thumb.webp')}" alt="" loading="lazy" width="640" height="400">
      </a>
    </div></li>`).join('');

  $$('.row__t', list).forEach(el => split(el));
  revealOnView($$('.row__t', list), { threshold: .4, margin: '0px 0px -4% 0px' });

  // Row click opens the project view instead of jumping to the hash.
  $$('.row', list).forEach(a => a.addEventListener('click', e => {
    e.preventDefault();
    openProject(a.closest('.item').dataset.id, a);
  }));

  // Filter chips.
  const counts = id => id === 'all' ? PROJECTS.length : PROJECTS.filter(p => FIELDS[p.id].includes(id)).length;
  filters.innerHTML = FILTERS.map(([id, name], i) =>
    `<button class="chip" type="button" data-f="${id}" aria-pressed="${i === 0}" data-cursor="link">${name}<sup>${pad2(counts(id))}</sup></button>`).join('');
  filters.addEventListener('click', e => {
    const b = e.target.closest('.chip');
    if (!b) return;
    $$('.chip', filters).forEach(c => c.setAttribute('aria-pressed', String(c === b)));
    let shown = 0;
    $$('.item', list).forEach(item => {
      const on = b.dataset.f === 'all' || item.dataset.fields.split(' ').includes(b.dataset.f);
      item.classList.toggle('is-out', !on);
      item.inert = !on;
      if (on) shown++;
    });
    count.textContent = pad2(shown);
  });

  initPeek(list);
}

// Floating preview: eases towards the pointer, tilts with its horizontal speed, and swaps image per row.
function initPeek(list) {
  if (!fine || reduced) return;
  const peek = $('#peek');
  peek.innerHTML = PROJECTS.map(p => `<img src="${p.gallery[0].src.replace(/[^/]+$/, 'thumb.webp')}" alt="" data-id="${p.id}">`).join('');
  const imgs = new Map($$('img', peek).map(i => [i.dataset.id, i]));
  let x = pointer.x, y = pointer.y, active = false, half = [0, 0];

  const setActive = (id) => {
    imgs.forEach((img, key) => img.classList.toggle('is-on', key === id));
    const on = !!id;
    if (on !== active) { active = on; peek.classList.toggle('is-on', on); }
    if (on) { half = [peek.offsetWidth / 2, peek.offsetHeight / 2]; }
  };

  list.addEventListener('pointerover', e => {
    const item = e.target.closest('.item');
    setActive(item && !item.classList.contains('is-out') ? item.dataset.id : null);
  });
  list.addEventListener('pointerleave', () => setActive(null));
  addEventListener('scroll', () => { if (active && !list.matches(':hover')) setActive(null); }, { passive: true });

  onFrame(() => {
    if (!active && !peek.classList.contains('is-on')) return;
    const px = x;
    x = lerp(x, pointer.x, .12);
    y = lerp(y, pointer.y, .12);
    const tilt = clamp((x - px) * 1.4, -14, 14);
    peek.style.translate = `${(x - half[0]).toFixed(1)}px ${(y - half[1]).toFixed(1)}px`;
    peek.style.rotate = `${tilt.toFixed(2)}deg`;
  });
}
