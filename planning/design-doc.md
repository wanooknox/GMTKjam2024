# Design Doc 

## Theme
Built to Scale

## Core Idea
You are a lowly construction worker on a job site with a failing saffolding. You need to repair the saffolding BEFORE the saftey inspector shows up.


## Feature Ideas
* multi layer saffolding with bolts that need tightened
* each layer of the saffolding gets "harder" to fix
* Tool upgrades as you progress to make fixing problems faster
* Tool gets replaced by the new "upgrade" tool once picked up
* (stretch) Tool belt to carry multiple tools that are applicable to different problems
* Can only carry one tool at a time, the rest of the tools are stored at ground level
* unlockable elevator that can be used to reach the ground faster
* End screen is a saftey score card

## Feature Goals
* MVP
  * [x] Player character with movement controller
  * [x] Gravity
  * [x] Platform collisions
  * [x] Jumping between platforms
  * [ ] Problem Points (interactable object with timer that needs to be fixed)
  * [x] Scoring system + Score UI
  * [ ] Audio system: ability to play arbitrary audio
* Extras
* [ ] Pixel font of UI text
  * Multiple different problems that require different tools
    * [ ] Loose nails (hammer)
    * [ ] Loose bolts (drill)
    * [ ] Extended plank (saw)
  * [ ] Faster tools for faster fixing
  * [ ] Unlockable elevator to reach the ground and swap tools quickly
  * [ ] Saftey Review Card as the score screen
  * [ ] Different interaction methods for different tools (Hold button for drill, tap for hammer, arrow keys for saw)
  * [ ] (Stretch) Unlevel floor panels, you need to shorten the vertical beam below