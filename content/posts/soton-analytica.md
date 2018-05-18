---
title: Soton Analytica
date: 2018-05-07
---

{{< project soton-analytica >}}

It seems that yet again I have found myself wasting my time creating slightly insane projects at Hackathons and this one trumps the previous ones by a fair bit.

The inspiration for this came from the [recent scandals][fb-scandal] about Facebook sharing user data with the policital firm Cambridge Analytica. This was then combined with some slightly crazy
computer science students, our success from [Brumhack 7.0][brumhack] and [Kajetan's][kch] desire to learn how to create games.

It is perhaps not beneficial to my degree that [Hack The South][hts] is held so close to the exam period, but it seems that I was not the only student enticed by a promise of free food and the opportunity to
win things for creating slightly useless code.

I think the only way that anybody reading this article will take this even somewhat seriously is if I start with the tech behind the project. I have previously worked on "massively multiplayer" project on Brumball.
However, this time I seeked to build on the problems that we had during that project to create a much more reliable system that could cope with more users and hopefully have nicer code. This inevitably meant not
using Java for the server this time, that was a crazy idea before and I would worry about my sanity if I were to think it was a good idea to do that again. Java is nice for many applications and I particularly like
it's ability to build abstraction over problems. It's just not for web. Hence we went with [Flask][flask].

At Brumball, we stored the current state of the game in RAM on the server. This was the simplest way to do it and certainly made sense for us at the time. Since then, I have discovered the asynchronous abilities of
PostgreSQL and realised the improvements that storing the game state in a database would bring. Not only does it take the strain of data processing off the game code, but it allows us to potentially play back a game
in full after it has been played.

As the actual game was going to be a 2D scroller, we quickly settled on using the Pygame library, which is a simple wrapper around SDL, for the graphics. It is lightweight, easy to use and has the ability to make use of
OpenGL if enabled. I had written projects in Pygame before but they were somewhat simple and that was a while ago.

The presentation was *mostly* a success. We were able to get everybody playing the game together for a couple of minutes. However, the WiFi access point in the room then decided that it no longer liked to handle our traffic,
likely due to an overload of requests from people spamming their clients. Everybody seemed to enjoy it though and we were quite happy with the outcome of the project, despite the complete lack of sleep.

{{< figure src="/img/posts/soton-analytica/menu.png" width="80%" caption="Menu Screen">}}

{{< figure src="/img/posts/soton-analytica/game.png" width="80%" caption="Game Play">}}

{{< figure src="/img/posts/soton-analytica/data.png" width="80%" caption="A data packet approaching the Z U C C">}}

{{< figure src="/img/posts/soton-analytica/zucc.png" width="30%" caption="The final evolution">}}

<iframe src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FHackTheSouthUK%2Fvideos%2F362808747563165%2F&show_text=0&width=560" width="560" height="315" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allowFullScreen="true"></iframe>

{{< figure src="/img/posts/soton-analytica/winners.jpg" width="80%" caption="We won first prize.">}}

[fb-scandal]: http://www.bbc.co.uk/news/technology-43649018
[brumhack]: /projects/brumball
[kch]: https://kajetan.ch/
[hts]: https://hackthesouth.co.uk
[flask]: http://flask.pocoo.org/
