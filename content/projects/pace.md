---
title: PACE
---

{{< project pace >}}

This project was an idea that came to me when my old school announced that they no longer had the budget to pay for the expensive database system that they were previously using to manage their pupils' achievement points. After discussion with them, I decided to write a replacement and thus began a long story with two versions of software and a lot of learning on my behalf.

The requirements of the software were not as simple as I'd first imagined. I thought it would be possible to integrate the system with the school's data management software and active directory to simply wrap the APIs and provide a nice, pretty web interface for pupils to view it with. I was wrong.

Some of the problems I encountered included:

- Data Management System had no free API.
- The School would not allow access to the database behind the DMS.
- The School would not allow access to Active Directory or any on-site services.
- I could not run any software on the school's systems.

This was frustrating, but after a long time I was able to get a working system.

Features included:

- Pupils could login to:
  - View their individual points.
  - View their Tutor Group's points.
  - View their House points.
- Teachers could login to:
  - View their tutee's points
  - View House points and statistics
- Administrators could login to:
  - Assign points
  - Create competitions
- Automatic Password Reset
- Semi-Automatic data updating
- Display for the in-school screens

During Summer 2017, I developed a newer, more robust system that would require less maintenance after I left the school. Unfortunately, my efforts went to waste as the school decided to stop using the system entirely shortly after. All the source is available on GitHub and I welcome anybody to make use of it.
