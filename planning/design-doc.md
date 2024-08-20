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
  * [x] Problem Points (interactable object with timer that needs to be fixed)
  * [x] Scoring system + Score UI
  * [x] Audio system: ability to play arbitrary audio
* Extras
  * Game timer mechanism 
    * [x] Add a game countdown manager to track time left
    * [x] Display seconds remaining in top left of screen
    * [x] When timer ends, game is over, display Safety Review Card or game over UI
    * [x] Support easy, medium, and hard time limits
    * [x] UI on welcome screen to select difficulty
  * [x] Figure out how to replace the font and find a Pixel font for UI text
  * Add tool switching mechanism (stand over tool and interact to pickup, drops current tool)
    * [x] model tools as physics objects (so they collide with environment tiles)
    * [x] stand over tool and interact to pickup, drops current tool
    * [x] display tool held by worker (bind tool object to player or just swap player sprite?)
    * [x] when tool is dropped, add instant upward velocity to "throw" it and let physics land it on the ground (adds a bit of chaos to switching tools 🙂)
  * Multiple different problems that require different tools
    * [x] Loose nails (hammer)
    * [x] Loose bolts (drill)
    * [ ] Extended plank (saw)
  * Sounds
    * [x] Jump sfx
    * [ ] Pickup tool sfx
    * [x] hammer sfx
    * [x] drill
    * [ ] saw
    * [ ] invalid tool interaction
    * [ ] land on ground
  * [x] flip character sprite when changing directions
  * [x] character sprites for running/jumping (bobbing animation for running)
  * [x] sprite sheet for environment tile map
    * [x] wood planks
    * [x] ground dirt
    * [x] background brick wall
    * [x] window shapes for variety
    * [x] blue sky for outside edge of building
    * [x] metal struts?
  * [ ] ~~Faster tools for faster fixing?~~
  * [x] Saftey Review Card as the score screen
  * [x] Different interaction methods for different tools (Hold button for drill, tap for hammer, arrow keys for saw)
  * [ ] ~~Unlockable elevator to reach the ground and swap tools quickly~~
  * [ ] (Stretch) Unlevel floor panels, you need to shorten the vertical beam below