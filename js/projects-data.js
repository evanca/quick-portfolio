// Single source of truth for the project index and the full-screen project view
// (js/works.js and js/case.js). `gallery[0]` is the large image at the top of a project;
// the rest fill the sideways gallery. Files live in Assets/projects/<id>/ (thumb.webp is the
// 640x400 preview used by the index).
export const PROJECTS = [
  {
    id: 'condeixa', title: 'Condeixa XR', year: '2025',
    blurb: "A geolocated augmented-reality PWA for the Município de Condeixa-a-Nova: a map of points of interest, an AR mode with image tracking over real facades, an embedded 360º tour, and every piece of content editable by the town's own staff.",
    problem: "Visitors arrive on foot with one hand free and no appetite for installing an app. The heritage story lives on plaques nobody reads, and the municipality had no way to update it without a developer.",
    decisions: "A PWA instead of native, so a QR code on site is the whole install step. Image tracking against the buildings themselves rather than GPS-anchored overlays, because GPS drifts by metres and a facade doesn't. MapLibre over a proprietary SDK for styling control and no per-view billing. Sanity as the CMS, so POIs and 360º scenes ship without a deploy.",
    tags: ['MindAR.js', 'MapLibre', 'Sanity CMS', 'PWA'],
    gallery: [
      { src: 'Assets/projects/condeixa/01.webp', caption: '360º tour, heritage overlay on the square',
        alt: "A black-and-white historical photograph of the square blended into the live 360º view of the street as it looks today." },
      { src: 'Assets/projects/condeixa/02.webp', caption: 'AR mode, tracking a printed image',
        alt: "A phone running the AR mode, held up to a framed historical photograph, with the tracked overlay locked onto it." },
      { src: 'Assets/projects/condeixa/03.webp', caption: 'Entry screen, three ways in',
        alt: "The Condeixa XR entry screen on a phone, offering the AR app, the 360º virtual tour and the interactive map." },
      { src: 'Assets/projects/condeixa/04.webp', caption: 'Point of interest, editable by the town',
        alt: "A point of interest page for Republic Square on a phone, with a photograph, its history in English, and language switches." },
      { src: 'Assets/projects/condeixa/05.webp', caption: 'MapLibre map of the points of interest',
        alt: "The interactive map on a phone, with teal pins marking points of interest across Condeixa-a-Nova." },
      { src: 'Assets/projects/condeixa/06.webp', caption: 'Aerial scene of the town',
        alt: "An aerial 360º scene looking over the rooftops of Condeixa-a-Nova toward the hills." }
    ]
  },
  {
    id: 'pacheca', title: 'Quinta da Pacheca', year: '2025',
    blurb: "A rebuilt interactive 360º tour of a Douro wine estate, with cellar, vineyard and rooms walkable in sequence and VR playback for on-site headsets.",
    problem: "The existing virtual tour was a dead end: disconnected panoramas, no sense of the route through the estate, and nothing that worked in a headset. Bookings depend on people believing the place before they drive three hours to it.",
    decisions: "Rebuilt the tour as a connected graph of scenes so movement follows how a guide actually walks a visitor through. Designed the hotspot and caption layer in Figma first, then built it in 3DVista rather than a custom viewer, so the estate's own team can re-shoot and replace scenes. Kept the UI light enough to hold framerate in VR.",
    tags: ['3DVista', 'Figma', 'VR'],
    gallery: [
      { src: 'Assets/projects/pacheca/01.webp', caption: 'Wine barrel guest rooms',
        alt: "The estate's wine barrel guest rooms seen from the garden path, with the Douro hills behind them." },
      { src: 'Assets/projects/pacheca/02.webp', caption: 'Opening scene over the vineyard',
        alt: "The tour's opening aerial scene, looking down over the estate buildings surrounded by terraced vineyard." },
      { src: 'Assets/projects/pacheca/03.webp', caption: 'Arrival at the estate gate',
        alt: "The entrance to Quinta da Pacheca from the road, with a navigation arrow marking the way in." },
      { src: 'Assets/projects/pacheca/04.webp', caption: 'Section menu, cellar to vineyard',
        alt: "The tour's section menu listing Lagar, Store, Restaurant, Spa and Vineyards beside a photograph of the wine store." }
    ]
  },
  {
    id: 'nb', title: 'Grupo NB Tour', year: '2025',
    blurb: "A 360º walkthrough of a residential complex in Aveiro, built for sales while the buildings were still unfinished.",
    problem: "Apartments had to be sold off-plan. Renders convince nobody about scale, light or how far the balcony really is from the street.",
    decisions: "Anchored the tour on real captured space rather than renders wherever construction allowed it, and kept a consistent eye height between scenes so rooms read at true scale. Structured navigation by unit type, so a buyer only walks the apartment they are considering.",
    tags: ['3DVista', '360º capture'],
    gallery: [
      { src: 'Assets/projects/nb/01.webp', caption: 'Apartment interior, unit walkthrough',
        alt: "The living room of a finished apartment, with full-height balcony doors open to the street." },
      { src: 'Assets/projects/nb/02.webp', caption: 'The complex from above',
        alt: "An aerial scene of the finished residential complex, with the lagoon and the town behind it." },
      { src: 'Assets/projects/nb/03.webp', caption: 'Exterior, entrance to block 4',
        alt: "The exterior approach to block 4 of the complex, with the entrance signage and navigation arrows." }
    ]
  },
  {
    id: 'spy', title: 'Spy Room', year: '2024',
    blurb: "Mixed reality for Meta Quest: room scanning turns the player's own space into the level.",
    problem: "A mixed-reality level cannot be authored in advance. Every player's room has different walls, furniture and free floor, and the design has to survive geometry it has never seen.",
    decisions: "Built the level generation on scene-understanding data: walls become surfaces for objectives, furniture becomes cover, and free floor sets the play area. Every placement rule has a fallback for cramped rooms, and the game refuses to start rather than spawning something inside a sofa.",
    tags: ['Unity', 'C#', 'Meta Quest SDK'],
    gallery: [
      { src: 'Assets/projects/spy/01.webp', caption: 'Laser grid over a scanned room',
        alt: "A grid of red laser beams generated across a real living room, passed through to the headset camera." },
      { src: 'Assets/projects/spy/02.webp', caption: 'Objective placed on a real wall',
        alt: "A hexagonal wiring puzzle anchored to a real wall, with the player's gloved hands holding a tool in front of it." },
      { src: 'Assets/projects/spy/03.webp', caption: 'Furniture becomes level geometry',
        alt: "A glowing virtual device resting on a real chest of drawers, placed there by the scene-understanding pass." }
    ]
  },
  {
    id: 'bake', title: "Bake 'Em Up!", year: '2024',
    blurb: "A VR survival game about baking under pressure, with hand-driven interaction and a strict performance budget on standalone hardware.",
    problem: "Standalone headsets give you no headroom: drop frames and players feel it in their stomach. The game still had to keep several physics-driven objects in the air at once.",
    decisions: "I handled the menus, the AI for every enemy type, and the ragdolls they collapse into when they go down. All three had to live inside the frame budget: with several enemies active at once, their behaviour and their physics are the first things a standalone headset struggles with. Pooled objects, simplified colliders and baked lighting bought back the headroom.",
    tags: ['Unity', 'C#', 'VR'],
    gallery: [
      { src: 'Assets/projects/bake/01.webp', caption: 'Hand-driven interaction at the oven',
        alt: "The player's cartoon paws reaching for a timer on an orange oven in a stylised kitchen." },
      { src: 'Assets/projects/bake/02.webp', caption: 'Title screen, the bakery truck', animated: true,
        alt: "Animated clip of the game's title screen: a pink bakery truck parked in a cartoon city, its menu open on the side." },
      { src: 'Assets/projects/bake/03.webp', caption: 'Mixing under the clock', animated: true,
        alt: "Animated clip of a mixing bowl being worked in the kitchen while the order board and timer count down." },
      { src: 'Assets/projects/bake/04.webp', caption: 'Serving the queue', animated: true,
        alt: "Animated clip of cartoon cat customers waiting in the street while a pastry is carried over to them." }
    ]
  },
  {
    id: 'creative-learning', title: 'Creative Learning', year: '2026',
    blurb: "Multi-tenant e-learning platform for corporate training across companies and roles, with a React frontend over a custom WordPress REST API.",
    problem: "One training company running courses for many client companies at once, with four roles that each had to see only their own slice. The existing WordPress install had no way to scope courses, enrollments and progress by company, and nothing stopping one company from reading another's data.",
    decisions: "I kept WordPress as the backend, Tutor LMS for course structure and ACF for custom fields, and put a React frontend on a REST API layer I wrote rather than stitching native endpoints together. Every endpoint re-checks identity server-side and never trusts a company or user ID sent from the client, since that is the only real boundary between companies. A known ACF and LMS plugin conflict silently dropped some fields, so a few reads go straight to the database.",
    tags: ['React.js', 'WordPress', 'ACF', 'REST API'],
    gallery: [
      { src: 'Assets/projects/creative-learning/01.webp', caption: 'Company dashboard',
        alt: "A client company's dashboard: counters for courses, collaborators and processes above tables listing each course and each collaborator's progress." },
      { src: 'Assets/projects/creative-learning/02.webp', caption: 'Quiz attempt, submitted in one shot',
        alt: "A single quiz question with yes and no options and a submit button, the state held in memory until the attempt ends." },
      { src: 'Assets/projects/creative-learning/03.webp', caption: 'What a trainee is scoped to see',
        alt: "A trainee's own view, showing only their enrolled and completed courses and nothing belonging to another company." },
      { src: 'Assets/projects/creative-learning/04.webp', caption: 'Course administration and notifications',
        alt: "The course administration table with start and end dates and enrolled counts, beside a panel of enrolment notifications." },
      { src: 'Assets/projects/creative-learning/05.webp', caption: 'Course editor, lessons and tests',
        alt: "The course editor, with columns for videos, tasks and tests above a form for the lesson title and its content." },
      { src: 'Assets/projects/creative-learning/06.webp', caption: 'Sign in',
        alt: "The Creative Learning sign-in screen, with username and password fields on the platform's peach branding." }
    ]
  }
];
