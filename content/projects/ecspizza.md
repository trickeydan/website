---
title: ecs.pizza
---

{{< project ecspizza >}}

## A competitive pizza tracking system
ecs.pizza was developed during CampusHack, a 24 hour hackathon held in March 2018. It was run by
the [Electronics and Computer Science Society][ecss-fb] at the University of Southampton.
Despite being barely relevant to the theme of the hackathon, ecs.pizza was awarded third place.

## Repositories
ecs.pizza is split up over multiple repositories to separate out the components:

- [ecspizza-android][ecspizza-android]
  - Android Client
  - Written in Java
- [ecspizza-art][ecspizza-art]
  - Art assets for the project
- [ecspizza-fingerprint][ecspizza-fingerprint]
  - Custom Computer Vision algorithms
  - Written in Python with the OpenCV library
  - Creates a fingerprint from a picture of a pizza that can then be used to see if two pictures are of the same pizza
  - Prevents *cheating*!
- [ecspizza-flask][ecspizza-flask]
  - Web Client + API
  - Written in Python with [flask][flask]
  - User registration and login system
  - Pizza Leaderboard
  - Works with ecspizza-ispizza to verify images
  - Exposes a REST API for the Android App
- [ecspizza-ispizza][ecspizza-ispizza]
  - Machine learning algorithm to detect pizza.
  - Essentially a wrapper around [TensorFlow][tensorflow]
  - Ensures that submitted images are pizza.
- [ecspizza-presentation][ecspizza-presentation]
  - The presentation we gave at the hackathon
  - Written in [reveal.js][reveal]

## Pictures of the Project

{{< figure src="/img/projects/ecspizza/my_pizza.png" width="80%" caption="Pizza Dashboard">}}

{{< figure src="/img/projects/ecspizza/leader.png" width="80%" caption="Pizza Leaderboard">}}

{{< figure src="/img/projects/ecspizza/area_view.png" width="30%" >}}

The circle in the above picture shows the radius of the total pizza eaten, overlaid on top of the Zepler Building at the University of Southampton.

{{< figure src="/img/projects/ecspizza/app_login.png" width="30%" caption="App Login Screen" >}}

{{< figure src="/img/projects/ecspizza/app_list.png" width="30%" caption="App Dashboard" >}}

{{< figure src="/img/projects/ecspizza/pizzaprint.png" width="80%" >}}

PizzaPrint, our pizza fingerprinting system.

## Pictures of the Hackathon

Images are from the [ECSS Facebook Page][ecss-fb]

{{< figure src="/img/projects/ecspizza/hackathon.jpg" width="80%" caption="The Hackathon" >}}

{{< figure src="/img/projects/ecspizza/team.jpg" width="80%" caption="ecs.pizza team" >}}

{{< figure src="/img/projects/ecspizza/working.jpg" width="80%" caption="Most of us stayed up all night" >}}

{{< figure src="/img/projects/ecspizza/stack.jpg" width="80%" caption="This meant we had the obligatory stack of cans and coffee cups!" >}}

{{< figure src="/img/projects/ecspizza/present.jpg" width="80%" caption="Our Presentation" >}}


[ecspizza-android]: https://github.com/dysfunctionals/ecspizza-android
[ecspizza-art]: https://github.com/dysfunctionals/ecspizza-art
[ecspizza-fingerprint]: https://github.com/dysfunctionals/ecspizza-fingerprint
[ecspizza-flask]: https://github.com/dysfunctionals/ecspizza-flask
[ecspizza-ispizza]: https://github.com/dysfunctionals/ecspizza-ispizza
[ecspizza-presentation]: https://github.com/dysfunctionals/ecspizza-presentation
[flask]: http://flask.pocoo.org/
[tensorflow]: https://www.tensorflow.org/
[reveal]: https://revealjs.com/
[ecss]: https://society.ecs.soton.ac.uk
[ecss-fb]: https://www.facebook.com/ecss.soton/
