---
title: Smallpeice 2018
date: 2018-08-12
---

About two years ago, I attended a summer school at the University of Southampton. It was organised by a charity called [The Smallpeice Trust][smallpeice], who run STEM courses for 13 - 18 year old children in the UK. At the time I enjoyed it, but little did I realise at the time that I would end up running the same course just two years later.

The general way that I describe the course to people is to take a typical [Student Robotics][srobo] or [SourceBots][sb2018] competition and squeeze it into a week. Yes, that is as crazy as it sounds. No, the robots aren't great (usually). We do however have something that we didn't have at SourceBots: lots of money. [ARM][arm] is very kind and sponsors us. We do have additional costs compared to SourceBots, as we provide the students with all of the materials to build their robots, rather than just the basic electronics kits.

## The Game

{{< figure src="/img/posts/smallpeice2018/arena.svg" width="50%" caption="Layout Diagram of the Arena">}}

After the thresholding issues that we encountered at the SourceBots competition in April and realising that we had yet to reliably fix this, we decided to design the game this year to not use fiducial markers. This unfortunately meant a lack of cubes, something we all found a little weird. I did submit a modified version of the game from SourceBots, but this was deemed to be too complex for teams to play with ultrasound sensors.

The game design chosen was based off a game that has been played several times before, Tin Can Rally". This previously involved racing around an arena and picking up cans. We decided that this was a little too boring though and have added an additional super (soup-er) can in the centre, which has the effect of halving the points of your competitor.


[arm]: https://www.arm.com/
[sb2018]: /posts/sb2018
[smallpeice]: https://www.smallpeicetrust.org.uk/
[srobo]: https://studentrobotics.org
