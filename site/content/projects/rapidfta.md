---
title: RapidFTA
description: An advanced search tool for BidFTA auctions that aggregates lots across locations, tracks average sale prices and emails you when the things you want are ending.
date: 2023-05-01
order: 1
featured: true
url: https://rapidfta.com
tags:
  - go
  - angular
  - docker
  - postgres
thumbnail:
  src: /images/rapidfta_logo.svg
  alt: RapidFTA logo
---

[RapidFTA](https://rapidfta.com) is an advanced searching tool for BidFTA auctions. It aggregates auctions across multiple locations and provides powerful filtering to help users quickly find what they're looking for.

Built with an Angular frontend, a Go backend and PostgreSQL, deployed as a Docker Swarm stack with per-PR preview environments.

## Features

- Infinite scrolling to quickly browse hundreds of auctions
- Quick-view auction photos
- Filters saved in the URL, so a bookmark is a saved search
- Advanced filtering:
  - Location-based search
  - Multi-tag text search across name and description, with matching keywords highlighted and pushed to the top
  - Text exclusion to hide uninteresting results
  - MSRP price range, maximum current bid and minimum percent-off filters
  - **Average price tracking**: the average sale price of the item across all past auctions, which shows whether a deal is really a deal
  - Time-remaining filter for auctions ending soon
- A daily digest email with new items matching the filters you set up
- Auction-ending email notifications for items you're interested in
- Dark mode
