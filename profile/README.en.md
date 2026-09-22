<div align="center">

<p>
  <a href="README.md"><img src="img/langues/fr-off.png" alt="Lire cette page en français" width="150" /></a>
  <img src="img/langues/en-on.png" alt="English, page shown" width="150" />
</p>

<img src="img/en/banniere.png" alt="MicroCoaster, modular connected miniature roller coaster kits" width="100%">

</div>

**MicroCoaster** designs and sells modular miniature roller coaster kits, at **1:78** scale, for enthusiasts, collectors and engineers. Every layout is made of standalone modules that join the network and are driven from a web application.

Founded by **Thomas Schirnhofer** in Austria · [microcoaster.com](https://microcoaster.com)

This organisation holds all the software: the control application, the ESP32 firmwares for the modules, and the community tools.

<img src="img/en/sections/s01.png" alt="01 The application" width="100%">

<a href="https://github.com/Microcoaster/MicroCoasterWebApp"><img src="img/en/webapp.png" alt="MicroCoaster WebApp, the web control application" width="100%"></a>

Live at **[app.microcoaster.com](https://app.microcoaster.com)**. It discovers the connected modules, shows their telemetry in real time, and lets you build timelines that orchestrate a whole layout: station dispatch, points, light effects, smoke and audio fired in the order you want.

It is also what decides. A module never starts moving on its own: it carries out an order from the server, the only one that knows the full state of the layout. That asymmetry is the design rule that holds everything else up.

**Node.js · Express · MySQL · Socket.io for the web pages · raw WebSocket for the ESP32s**

<img src="img/en/sections/s02.png" alt="02 The modules" width="100%">

They all share the same base: an ESP32 under PlatformIO, a captive portal for joining the network, then a permanent WebSocket link to the server.

<a href="https://github.com/Microcoaster/MicroCoaster_WifiManager"><img src="img/en/wifimanager.png" alt="WiFi Manager, the base firmware shared by the modules" width="100%"></a>

<a href="https://github.com/Microcoaster/Switch-Track"><img src="img/en/switchtrack.png" alt="Switch Track, the points module" width="100%"></a>

<a href="https://github.com/Microcoaster/Launch-Track"><img src="img/en/launch.png" alt="Launch Track, the launch section" width="100%"></a>

<a href="https://github.com/Microcoaster/Lift-Hill"><img src="img/en/lift.png" alt="Lift Hill, hauling the train up" width="100%"></a>

<a href="https://github.com/Microcoaster/Module-Audio"><img src="img/en/audio.png" alt="Audio module, an embedded player" width="100%"></a>

<a href="https://github.com/Microcoaster/Smoke-Machine"><img src="img/en/smoke.png" alt="Smoke Machine, the smoke module" width="100%"></a>

<a href="https://github.com/Microcoaster/ESP-32-led"><img src="img/en/led.png" alt="LED bench, the test version of the Switch Track" width="100%"></a>

Two ways of giving the train the energy it will live on: haul it to the top of a hill, or accelerate it over a few tens of centimetres. The **Lift Hill** does the first, the **Launch Track** the second.

<img src="img/en/sections/s03.png" alt="03 Around the product" width="100%">

<a href="https://github.com/Microcoaster/Microcoaster-bot"><img src="img/en/bot.png" alt="The Discord support and warranty bot" width="100%"></a>

<a href="https://github.com/Microcoaster/GuessTheCoaster"><img src="img/en/guess.png" alt="Guess The Coaster, a community Discord game" width="100%"></a>

<a href="https://github.com/Microcoaster/MicroCoaster_Docs"><img src="img/en/docs.png" alt="MicroCoaster Docs, the holding page for the product documentation" width="100%"></a>

<a href="https://github.com/Microcoaster/MicroCoaster_Forum"><img src="img/en/forum.png" alt="MicroCoaster Forum, the holding page for the community forum" width="100%"></a>

The documentation and the forum do not exist yet. These two repositories hold their domains in the meantime, with a countdown and a language switch. An Express server serving static files, with no build step: a holding page that needs a toolchain is a holding page nobody dares touch again.

<img src="img/en/sections/s04.png" alt="04 Working here" width="100%">

<img src="img/en/schemas/cycle.png" alt="An issue, then a branch, commits, a review, the merge" width="100%">

<img src="img/en/schemas/branches.png" alt="Branch graph. main carries stable production code. develop is where development is integrated. feature and bugfix start from develop and come back onto it, for new features and fixes. hotfix starts from main and comes back onto it, for an urgent fix grafted onto production. None of these lines reaches main or develop without going through a review." width="100%">

A bug spotted or an idea passing through: open an issue straight away. That is what keeps it from being forgotten, what lets it be discussed, and what keeps a record of the decision.

**Conventions.** Commits in `type: description` form, for example `feat: ajout contrôle fumée`. Branches prefixed then described in kebab-case. Issues labelled `bug`, `fonctionnalité` or `documentation`. Pull requests with a clear description and a reference back to the issue.

**Not up for discussion.** No direct push to `main` or to `develop`. Review required before merging. Local tests before opening a pull request. A clean, linear history.

The [**contribution guide**](https://github.com/Microcoaster/.github/blob/main/CONTRIBUTING.md), in French, covers the Git commands, examples of the conventions and how to get out of the usual trouble. Sitting at the root of the `.github` repository, it serves as the default guide for every repository in the organisation.

<img src="img/en/sections/s05.png" alt="05 Following us" width="100%">

<p align="center">
  <a href="https://microcoaster.com"><img src="img/liens/site.png" alt="The site: microcoaster.com" width="72" /></a>
  &nbsp;&nbsp;
  <a href="https://discord.gg/NXqd4eYYQf"><img src="img/liens/discord.png" alt="The community on Discord" width="72" /></a>
  &nbsp;&nbsp;
  <a href="https://www.youtube.com/@microcoaster"><img src="img/liens/youtube.png" alt="The YouTube channel @microcoaster" width="72" /></a>
  &nbsp;&nbsp;
  <a href="https://instagram.com/microcoaster"><img src="img/liens/instagram.png" alt="The photos on Instagram @microcoaster" width="72" /></a>
</p>

<p align="center">
  <a href="https://microcoaster.com"><img src="img/liens/adresse.png" alt="microcoaster.com" width="380" /></a>
</p>

<img src="img/en/cloture.png" alt="MicroCoaster, endless hours of fun. microcoaster.com, scale 1:78, designed in Austria." width="100%">
