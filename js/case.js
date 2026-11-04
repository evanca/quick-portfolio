// Full-screen project view. It wipes up over the page, is reachable by URL
// (#project-<id>), traps focus by making the page inert, and closes with Esc or the back button.
import { PROJECTS } from './projects-data.js';
import { FIELDS } from './works.js';
import { $, $$, clamp, fine, reduced, revealOnView } from './utils.js';
import { split } from './split.js';

const esc = s => String(s).replace(/[&<>"]/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));
const pad2 = n => String(n).padStart(2, '0');

export function initCase() {
  const html = document.documentElement;
  const page = $('#page');
  const view = $('#case');
  const scroller = $('#case-scroll');
  const inner = $('#case-inner');
  const count = $('#case-count');
  const closeBtn = $('#case-close');

  let current = null;       // id of the project on screen
  let opener = null;        // element to give focus back to
  let pushed = false;       // did we add a history entry?

  const find = id => PROJECTS.findIndex(p => p.id === id);

  function render(id) {
    const i = find(id);
    const p = PROJECTS[i];
    const next = PROJECTS[(i + 1) % PROJECTS.length];
    const [lead, ...rest] = p.gallery;
    const shots = rest.length ? rest : [lead];

    count.textContent = `${pad2(i + 1)} / ${pad2(PROJECTS.length)}`;
    inner.innerHTML = `
      <p class="case__kicker mono"><span>Project ${pad2(i + 1)}</span><span>${esc(p.year)}</span><span>${FIELDS[p.id].map(f => f === 'xr' ? 'XR' : f[0].toUpperCase() + f.slice(1)).join(' / ')}</span></p>
      <h2 class="case__title" id="case-title" data-split data-reveal>${esc(p.title)}</h2>
      <ul class="case__tags" data-reveal aria-label="Technologies">${p.tags.map(t => `<li>${esc(t)}</li>`).join('')}</ul>

      <figure class="case__hero" data-clip data-reveal>
        <img src="${esc(lead.src)}" alt="${esc(lead.alt)}" width="1200" height="750">
      </figure>

      <div class="case__cols">
        <p class="case__lead" data-reveal>${esc(p.blurb)}</p>
        <div class="case__text" data-reveal>
          <div><h3 class="mono">The problem</h3><p>${esc(p.problem)}</p></div>
          <div><h3 class="mono">What I decided</h3><p>${esc(p.decisions)}</p></div>
        </div>
      </div>

      <div class="gal-wrap" data-reveal>
        <div class="gal" id="gal" tabindex="0" role="group" aria-label="Project images, scroll sideways" data-cursor="${fine ? 'drag' : ''}" data-cursor-label="Drag">
          ${shots.map((s, n) => `
            <figure>
              <img src="${esc(s.src)}" alt="${esc(s.alt)}" loading="lazy" draggable="false" width="1200" height="750">
              <figcaption class="mono"><span>${pad2(n + 1)}</span><span>${esc(s.caption)}</span></figcaption>
            </figure>`).join('')}
        </div>
        <div class="gal__ctl">
          <button class="gal__btn" type="button" data-dir="-1" aria-label="Previous image" data-cursor="link">←</button>
          <div class="gal__bar" aria-hidden="true"></div>
          <button class="gal__btn" type="button" data-dir="1" aria-label="Next image" data-cursor="link">→</button>
        </div>
      </div>

      <a class="case__next" href="#project-${next.id}" data-cursor="${fine ? 'label' : ''}" data-cursor-label="Next" data-next="${next.id}">
        <span class="mono">Next project</span>
        <span class="case__nexttitle">${esc(next.title)}</span>
      </a>`;

    split($('.case__title', inner));
    revealOnView($$('[data-reveal]', inner), { threshold: .15, margin: '0px 0px -6% 0px' });
    wireGallery();
    scroller.scrollTop = 0;
  }

  function wireGallery() {
    const gal = $('#gal', inner);
    const bar = $('.gal__bar', inner);
    const update = () => {
      const max = gal.scrollWidth - gal.clientWidth;
      const seen = gal.clientWidth / gal.scrollWidth;
      bar.style.setProperty('--gp', max > 0 ? (seen + (1 - seen) * (gal.scrollLeft / max)).toFixed(3) : 1);
    };
    gal.addEventListener('scroll', update, { passive: true });
    update();

    $$('.gal__btn', inner).forEach(b => b.addEventListener('click', () => {
      const w = $('figure', gal).getBoundingClientRect().width + 16;
      gal.scrollBy({ left: Number(b.dataset.dir) * w, behavior: reduced ? 'auto' : 'smooth' });
    }));

    // Mouse drag to scroll; touch already scrolls natively.
    let down = null;
    gal.addEventListener('pointerdown', e => {
      if (e.pointerType !== 'mouse' || e.button !== 0) return;
      down = { x: e.clientX, left: gal.scrollLeft };
      gal.classList.add('is-drag');
      gal.setPointerCapture(e.pointerId);
    });
    gal.addEventListener('pointermove', e => { if (down) gal.scrollLeft = down.left - (e.clientX - down.x); });
    const end = () => { if (!down) return; down = null; gal.classList.remove('is-drag'); };
    gal.addEventListener('pointerup', end);
    gal.addEventListener('pointercancel', end);
  }

  function open(id, from) {
    if (find(id) < 0) return;
    const wasOpen = current !== null;
    if (!wasOpen) opener = from || document.activeElement;
    const swap = () => {
      current = id;
      render(id);
      document.title = `${PROJECTS[find(id)].title} | Pedro Coelho`;
    };

    if (wasOpen) {
      if (id === current) return;
      inner.classList.add('is-swap');
      setTimeout(() => { swap(); inner.classList.remove('is-swap'); }, reduced ? 0 : 260);
      history.replaceState({ case: id }, '', `#project-${id}`);
      return;
    }

    swap();
    if (location.hash !== `#project-${id}`) { history.pushState({ case: id }, '', `#project-${id}`); pushed = true; }
    html.classList.add('is-locked');
    page.inert = true;
    view.inert = false;
    view.classList.add('is-open');
    setTimeout(() => scroller.focus({ preventScroll: true }), reduced ? 0 : 400);
  }

  function close({ fromHistory = false } = {}) {
    if (current === null) return;
    current = null;
    view.classList.remove('is-open');
    view.inert = true;
    page.inert = false;
    html.classList.remove('is-locked');
    document.title = 'Pedro Coelho, Full-Stack Developer';
    if (!fromHistory) {
      if (pushed) history.back();
      else history.replaceState(null, '', location.pathname + location.search);
    }
    pushed = false;
    opener?.focus?.({ preventScroll: true });
    opener = null;
  }

  closeBtn.addEventListener('click', () => close());
  addEventListener('keydown', e => { if (e.key === 'Escape' && current !== null) close(); });
  inner.addEventListener('click', e => {
    const n = e.target.closest('[data-next]');
    if (n) { e.preventDefault(); open(n.dataset.next); }
  });

  // Browser back/forward and deep links.
  const fromHash = () => {
    const m = location.hash.match(/^#project-([\w-]+)$/);
    if (m && find(m[1]) >= 0) open(m[1]);
    else close({ fromHistory: true });
  };
  addEventListener('popstate', fromHash);

  return { open, close, fromHash };
}
