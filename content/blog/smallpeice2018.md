---
title: Smallpeice 2018
date: 2018-08-12
tags:
  - robotics
  - event
---

About two years ago, I attended a summer school at the University of Southampton. It was organised by a charity called [The Smallpeice Trust][smallpeice], who run STEM courses for 13 - 18 year old children in the UK. At the time I enjoyed it, but little did I realise at the time that I would end up running the same course just two years later.

The general way that I describe the course to people is to take a typical [Student Robotics][srobo] or [SourceBots][sb2018] competition and squeeze it into a week. Yes, that is as crazy as it sounds. No, the robots aren't great (usually). We do however have something that we didn't have at SourceBots: lots of money. [ARM][arm] is very kind and sponsors us. We do have additional costs compared to SourceBots, as we provide the students with all of the materials to build their robots, rather than just the basic electronics kits.

## The Game

{{< figure src="/img/posts/smallpeice2018/arena.svg" width="50%" caption="Layout Diagram of the Arena">}}

After the thresholding issues that we encountered at the SourceBots competition in April and realising that we had yet to reliably fix this, we decided to design the game this year to not use fiducial markers. This unfortunately meant a lack of cubes, something we all found a little weird. I did submit a modified version of the game from SourceBots, but this was deemed to be too complex for teams to play with ultrasound sensors.

The game design chosen was based off a game that has been played several times before, Tin Can Rally". This previously involved racing around an arena and picking up cans. We decided that this was a little too boring though and have added an additional super (soup-er) can in the centre, which has the effect of halving the points of your competitor.

## School's (not) out for the summer

I wouldn't really expect that if you brought together fifty 17 year olds and put them in a room together, that they would be able to build somewhat competent robots in a week. Even though not one of them knew another, they managed this. We, of course, help them along a bit. We run workshops throughout the week so that they can learn the skills necessary to build their robots. We also run 3 lectures during the week, which give more of an insight to life at university.

## Relativistic Raspberries

One issue that was recognised but not diagnosed at [SourceBots 2018][sb2018], was robots turning off too early during the matches. We initially assumed this to be down to teams' code being buggy, but they were insistent that this was not the case. We weren't convinced at the time, as the error seemed to be particularly intermittent. We left it for a while, theorised about what it could be and didn't really do too much.

The actual problem is quite interesting when it was suggested to us what it could be. The timeout functionality in our software stack was using Python's `time.sleep` function, which is pretty standard. This would start running early in the program, when not much else was going on. Modern processors have a nice feature that let's them change their clock speed when usage is low, usually to save power. As the Pi began processing more information (computer vision), the clock speed of the Pi would increase. Strangely, this meant that the Pi would experience CPU time faster, and as this is what we were using to activate the robot timeout, it would cut out early.

The solution to this actually resulted in significantly nicer code for the timeout.

### Old Timeout Code

The previous code was definitely a hack and can be described as ugly:

```python
def kill_after_delay(timeout_seconds):	
    """
    Interrupts main process after the given delay.
    """
    
     end_time = time.time() + timeout_seconds	
     def worker():	
        while time.time() < end_time:	
            remaining = end_time - time.time()	
            time.sleep(max(remaining, 0.01))

         LOGGER.info("Timeout %rs expired: Game over!", timeout_seconds)

         # Interrupt the main thread to kill the user code	
        _thread.interrupt_main()  # type: ignore

     worker_thread = Thread(target=worker, daemon=True)	    
    worker_thread.start()

    return worker_thread
```

As you can see, this code spawns a second thread which then kills the parent thread on timeout. Whilst this seems okay in principle, the `_thread.interrupt_main` function is nasty. It sends the parent thread a `KeyboardInterrupt`. This interrupt would show on the team logs, and did cause some confusion and comments during SB2018.

### New Code

We decided to find a neater way to do this and the obvious place to look is in the Linux Kernel. Signals are pretty useful:

```python
def timeout_handler(signum, stack):
    """
    Handle the `SIGALRM` to kill the current process.
    """
    raise SystemExit("Timeout expired: Game Over!")

def kill_after_delay(timeout_seconds):
    """
    Interrupts main process after the given delay.
    """
    signal.signal(signal.SIGALRM, timeout_handler)
    signal.alarm(timeout_seconds)

```

Not only is this a smaller, neater solution, but it also removes the nasty `KeyboardInterrupt` from the logs. There is a disadvantage to this method though. In theory, teams could use a `try catch` statement and avoid the timeout. However, this is clearly cheating and would result in disqualification! 

All code snippets on this page are from [sourcebots/robot-api][robot-api], which is Open Source under the MIT Licence and can be found on GitHub.

[arm]: https://www.arm.com/
[sb2018]: /posts/sb2018
[smallpeice]: https://www.smallpeicetrust.org.uk/
[srobo]: https://studentrobotics.org
[robot-api]: https://github.com/sourcebots/robot-api/
