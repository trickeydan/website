---
title: SourceBots Competition 2018
date: 2018-04-25
tags:
  - robotics
  - event
---

{{< figure src="/img/posts/sb2018/sblogo.svg" width="50%" caption="SourceBots Logo">}}

Many months of hard work came to fruition last weekend, as we hosted the [SourceBots][sb] 2018 robotics competition at The University of Southampton.

Eight teams of sixth form students from surrounding colleges gathered at The Cube to compete their robot designs against each other. One way that I often like to describe SourceBots is like [Robot Wars][robot_wars], but less violent and completely autonomous.

## The Game

{{< figure src="/img/posts/sb2018/arena.svg" width="50%" caption="Layout Diagram of the Arena">}}

The game, as always with this style of robotics competition, involved moving cubes around an arena. The objective this year was to place cubes in the large zones marked by the colour of the corresponding robot's corner. 
The scoring was as follows:

 - +3 points for each token of your colour in your zone.
 - -1 points for any other colour in your zone.
 - +1 points for moving out of the starting area.

As the arena is setup with 5 opponent tokens in your zone, each team begins with -5 points at the start of each round. This led to all teams having an overall negative game score, but this was not an issue as we score positionally.

{{< figure src="/img/posts/sb2018/photo.jpg" width="50%" caption="The Arena, with beautiful rotationally symmetric tokens">}}

One issue that we came across when designing the competition is that if placed randomly, some robots could have an advantage compared to others in the same game. The solution to this was to place the markers rotationally symmetrically around the centre. I wrote a rather [nice python script][zone-gen] to generate layout diagrams to assist the volunteers in laying out the arena between matches.

The full rules for the 2018 game can be found in the [rules repository][rules] on the SourceBots GitHub.

## The Kit

We supplied the teams with a base kit centred around a [Raspberry Pi 3][raspi], with a board to regulate power, a motor board, a servo board and a webcam. The hardware was based on the [Student Robotics][sr] v4 kit. However, the software on the pi has been completely re-written by the SourceBots (see [our GitHub][sb-gh]). Improved features compared to the SR kit include full support for Python 3, a new [Fiducial marker][markers] system based on the [April Tags][april-tags] system developed at the University of Michigan and a fully automated image build system.
The kit is still in development after the competition and we have many more exciting ideas planned for the future. More information can be found on the [SourceBots docs][sb-docs] if you are interested.

## The Livestream

The competition finals were broadcast live by [SUSUtv][susu-tv], the student television society here at Southampton. 

<iframe src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FSUSUtv%2Fvideos%2F1891818877517292%2F&show_text=0&width=560" width="560" height="315" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allowFullScreen="true"></iframe>



[april-tags]: https://april.eecs.umich.edu/software/apriltag.html
[sb]: https://sourcebots.org
[sb-docs]: https://docs.bsourcebots.org
[sb-gh]: https://github.com/sourcebots/
[robot_wars]: https://en.wikipedia.org/wiki/Robot_Wars_(TV_series)
[raspi]: http://raspberrypi.org
[sr]: https://studentrobotics.org/
[markers]: https://en.wikipedia.org/wiki/Fiducial_marker
[zone-gen]: https://github.com/sourcebots/sb2018-zone-layout-generator
[rules]: https://github.com/sourcebots/sb2018-rules
[susu-tv]: https://www.facebook.com/SUSUtv/
