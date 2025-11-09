#set page(paper: "us-letter", margin: 0.5in)
#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: false, leading: 0.6em)
#set list(marker: [--])

// Header
#align(center)[
  #text(size: 22pt, weight: "semibold", tracking: 0.02em)[Carlos Aguilera]
  #v(-15pt)
  #text(size: 10pt)[
    (949) 973-1274 |
    #link("mailto:18aguilerac@gmail.com")[18aguilerac\@gmail.com] |
    #link("https://linkedin.com/in/aguilerac")[linkedin.com/in/aguilerac] |
    #link("https://github.com/devloos")[github.com/devloos] |
    #link("https://www.caguilera.dev")[caguilera.dev]
  ]
  #v(-3pt)
]

// Section heading function
#let section(title) = [
  #text(size: 13pt, smallcaps(title))
  #v(-9pt)
  #line(length: 100%, stroke: 0.5pt)
  #v(-8pt)
]

// Job/Education entry function
#let entry(title, date, subtitle, location) = [
  #v(2pt)
  #grid(
    align: auto,
    columns: (1fr, auto),
    [*#text(size: 11.5pt, weight: "bold")[#title]*],
    [#align(right)[#text(size: 10pt)[#date] #v(8pt)]],

    [#text(style: "italic", size: 10pt)[#subtitle]],
    [#align(right)[#text(style: "italic", size: 10pt)[#location] #v(4pt)]],
  )
  #v(-8pt)
]

// Education
#section[Education]
#entry(
  "California State University, Long Beach",
  "Expected May 2026",
  "B.S. Computer Science - 3.78 GPA",
  "Long Beach, CA",
)

// Experience
#section[Experience]

#entry(
  "Lead Software Engineer / Owner",
  "June 2025 -- Present",
  "The Inked Network (Nuxt, Supabase, Stripe, SEO, AI Integration, PostgreSQL)",
  "Lake Forest, CA",
)
#pad(left: 0.15in)[
  - Built and deployed a full-stack Nuxt + Supabase platform connecting 300+ tattoo artists with clients through real-time chat, profile systems, and subscription-based access.
  - Integrated Stripe, Google Maps API, OpenAI GPT-4o, and ImageKit/S3, enabling AI-powered image tagging, geolocation-based event listings, and automated subscription workflows.
  - Owned the project end-to-end from system design, CI/CD setup, and API integrations to responsive UI/UX, ensuring a polished, production-ready product.
  - Developed and published iOS and Android builds using Capacitor, implementing push notifications, offline caching, and deep linking while bridging native APIs for camera access.
]

#entry(
  "Full Stack Developer",
  "May 2022 -- Present",
  "Ethika Inc. (Vue.js, Symfony, MongoDB, Bootstrap, AWS, Redis, Docker, GitHub Actions)",
  "Lake Forest, CA",
)
#pad(left: 0.15in)[
  - Boosted site performance by 30% through CloudFront + S3 migration, compression, and AWS Graviton optimization, saving \$3K/month.
  - Engineered an AI-powered music CMS supporting 500+ artists and 5,000+ assets, integrating audio stem recognition, intelligent search, and recommendation features, along with a custom player.
  - Developed a Shopify-style page builder and integrated Google Tag Manager, streamlining marketing and analytics.
  - Cut search costs and latency by 60% by optimizing Algolia and migrating to TypeSense for scalable, reducing the number of queries. The migration to TypeSense saved us close to 75k a year.
  - Created a returns and inventory PWA, automating logistics and reporting to improve support efficiency and accuracy. This is integrated directly into our ERP system (Business Central).
  - Launched a promotional web game that pulled 200K+ plays and 20K+ users, driving significant brand engagement.
]

#entry(
  "Software Engineer",
  "August 2022 -- March 2025",
  "Nexpa LLC (Vue.js, NestJS, MongoDB, Tailwind CSS, AWS, Google Analytics)",
  "Lake Forest, CA",
)
#pad(left: 0.15in)[
  - Built a responsive food truck site with i18n, Square ordering (+15% revenue), automated emails, cron-based menu updates, and reusable UI components.
  - Developed and deployed a scalable restaurant platform using NestJS, Square Payments, and REST APIs; implemented CI/CD pipelines, cutting deployment time by 40% and boosting reliability.
]

// Projects
#section[Projects]

#entry(
  "Web Programmer",
  "July 2023 -- July 2024",
  "Saddleback College Robotics Club (ROS2, Python, Rust, C++, Vue.js, Django)",
  "Mission Viejo, CA",
)
#pad(left: 0.15in)[
  - Developed a Django + ROS2 web GUI enabling real-time rover navigation, science platform control, and telemetry monitoring. Implemented bi-weekly Scrum sprints, delivering functional features and tests on schedule.
  - Integrated live camera feeds and rover feedback into a responsive Vue.js frontend for the base station.
  - Contributed to the team's advancement to the University Rover Challenge finals, ranking three places higher.
]

// Technical Skills
#section[Technical Skills]
#pad(left: 0.05in)[
  - *Programming Languages:* JavaScript, TypeScript, PHP, C++, Java, Python, Rust, SQL
  - *Technologies:* Vue.js, Nuxt, React, Bootstrap, Tailwind CSS, Symfony, Django, NestJS, Node.js, Stripe, Capacitor
  - *Databases & Auth:* MongoDB, PostgreSQL, Redis, Supabase, JWT, OAuth2
  - *DevOps & Tools:* AWS, Vercel, Cloudflare, Docker, Railway, Git, Linux, Jira, Nginx
  - *Core Skills:* Agile development, problem-solving, collaboration, adaptability, analytical thinking
]
