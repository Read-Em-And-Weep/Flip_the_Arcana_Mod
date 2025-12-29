# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- Added a new config option - if you find you are getting stuck often after using Monstrosity (doors won't open), you can enable AlwaysUnlockAfterPurge, which will always unlock doors after collecting the purged reward. This includes when it shouldn't - for instance in Devotion chambers, or in the Fields of Mourning

## [2.5.1] - 2025-12-25

- Nerfed time Gorgon (Dusa) gives you invulnerability 

## [2.5.0] - 2025-12-24

- The Gorgon (Dusa) has been reworked to provide invulnerability time at the start of each encounter
- Encouragement (Supportive Shade) now awards a random collection of elements
- Hopefully fixed the issue of rarely getting both auto equip cards at the same time
- Changed the way the Loyal Protector (Cerberus) worked, preventing it from incorrectly saying it healed 0 (when it was actually healing you)

## [2.4.1] - 2025-12-22

- Fixed bug which caused Encouragement (Supportive Shade) triggering in Training Grounds

## [2.4.0] - 2025-12-22

- Buffed Revelry (Dionysus)
- Nerfed Longing (Narcissus and Echo) and Famine (Demeter)
- Hopefully fixed Companionship (Familiars) procing on Asterius miniboss in Zag Journey
- Stopped Famine (Demeter) from procing on enemies that cannot be charmed (e.g. Minibosses)
- Revelry (Dionysus)/Strife (Eris) affected by Success Rate
- Bounty (Poseidon) offers +1 rarify each rank
- Loyal Protector (Cerberus) now also heals in Warden/miniboss rooms!

## [2.3.4] - 2025-12-21

- Nerfed Strife (Eris), Revelry (Dionysus) and Doom (Moros)
- Buffed Loyal Protector (Cerberus)

## [2.3.3] - 2025-12-20

- Hopefully actually fixed the auto activating card issue
- Added Strife (Eris) art. Thanks @burn03!

## [2.3.2] - 2025-12-19

- Added a while loop that means trait inheritances are done independent of SetUpRun

## [2.3.1] - 2025-12-19

## [2.3.0] - 2025-12-19

- Removed a debug print statement (oops!)
- Added art for Longing (Echo and Narcissus - thanks @burn03!)
- AUTO EQUIP CARDS NO LONGER FREAK OUT!!!!

## [2.2.1] - 2025-12-16

- Fixed issue stopping ExtendedAshes from working
- Fixed some of the issues with lighting of the Monstrosity (Typhon) drop

## [2.2.0] - 2025-12-15

- Buffed Performance (Apollo) to be active at lower health
- Buffed Beauty (Aphrodite) to give additional dodge chance
- Nerfed the Weaver (Arachne) to give -1 armour per rank, and the doubling threshold was reduced from 20 -> 15
- Buffed Loyal Protector (Cerberus) to heal more per rank
- Monstrosity (Typhon) no longer offers Judgement as a possible card
- Added HUD support for Monstrosity (Typhon)
- Sleep (Hypnos) has been buffed to heal more quickly

## [2.1.1] - 2025-12-14

- Fixed LootChoiceExtender Crash (I think), thanks @zerp
- Cards which call a function when being drawn (such as the Boatman) will now actually perform their function (oops!) when picked from Monstrosity
- This mod no longer caps your natural god count at 2 (Typhon was so hungry for boons, he was even eating that slot)

## [2.1.0] - 2025-12-12

- New animation for Monstrosity loot drop (Thank you @burn03 for the animation and @zerp for implementing it!)

## [2.0.0] - 2025-12-12

Major Changes

- Monstrosity (Typhon) has been completely reworked to allow you to purge rewards to create a new loot type which rewards you with your choice of one of three unequipped arcana cards
- CONTROLLER PLAYERS REJOICE! Now you can flip cards using the reroll button without opening your themes tab.
- New art for Bounty (Poseidon). Thanks @PunishedMat! :)

Minor Changes

- Updated Wanderer (Odysseus) Text
- Stopped flipped cards from not being able to be unlocked if neighbouring cards weren't unlocked
- You take more damage when Retribution (Nemesis) is equipped
- Fixed Revelry (Dionysus) not properly applying the right number of upgrades
- Art for Encouragement (Supportive Shade) updated

## [1.5.1] - 2025-12-09

- Changed the icons that companionship familiar bonds use
- Corrected retribution multipliers for heroic and legendary upgrades

## [1.5.0] - 2025-12-07

    - Encouragement (Supportive Shade) now also awards a random infusion boon to make use of the elements
    - Performance (Apollo) and Revelry (Dionysus) nerfed
    - Bounty (Poseidon) has been buffed to offer more rarify uses
    - Gorgon (Dusa) buffed to reduce damage further

## [1.4.6] - 2025-12-06

- Added Monstrosity (Typhon) art, which is terrifying. Thanks @burn03
- Doom (Moros) art updated

## [1.4.5] - 2025-12-06

- Added Doom (Moros) art. Thanks @burn03!

## [1.4.4] - 2025-12-06

- Removed a debug print

## [1.4.3] - 2025-12-06

- Added art for Performance (Apollo). Thanks @burn03!
- Fixed an issue that meant you could not view pinned cards in the inventory

## [1.4.2] - 2025-12-06

- Fixed an error where the longing (Echo and Narcissus) to level up an extra trait was so great that it caused a crash

## [1.4.1] - 2025-12-05

- Fixed an error that targeted NikkelM specifically

## [1.4.0] - 2025-12-05

- Minor grammar and tooltip fixes
- Fixed issue with visibility of glow for flipped card

### New Art

- Companionship (Familiars), Hydra (Lernie), Retribution (Nemesis), Encouragement (Supportive Shade), has been added
- Slight variations made to previous cards

## [1.3.1] - 2025-12-05

### Changes

- Grammar fix on Strategist
- The cool new glow is now inactive for flipped cards if not equipped when they are first created/screen is first opened

## [1.3.0] - 2025-12-05

### Balance Changes made

- Sleep (Hypnos) reverted to previous status of always being active in guardian encounters! Hypnos is always with you :)
- The Strategist (Athena) has been improved, and now offers half of its benefit towards enemies with only a single status condition
- Retribution has been changed to reflect
- Revelry has been slightly buffed to activate more often
- Doom has been slightly nerfed
- New card glow colour for flipped cards! It's a more purple-blue to the original's green-blue. Subtle, but noticeable difference
- Terrible MS Paint art added for all cards!! 

## [1.2.1] - 2025-12-04

### Changes made

- Sleep (Hypnos) now is only active in guardian encounters and only while standing still. Time between heals has been shortened to compensate for this. If it is still too strong (not counting the legendary upgrade with Extended Altar of Ashes), please let me know.
- Legendary Upgrade of Sleep (Hypnos) in Extended Altar of Ashes removed, since it is far too strong.
- Terrible MS Paint art has been added for cards up until The Cyclops (Polyphemus). If it looks bad, assume I did it. Otherwise, all credit goes to @burn03

## [1.1.0] - 2025-12-04

### Fixed

- Hermes no longer has a vandetta against you playing the game and will not cause you to crash (hopefully)

### Balance Changes

- Blacksmith (Hepheastus) has been nerfed, and will now only activate for damage above 20. Maybe the Messager can finally be used over it and Hermes will stop being mad
- Beauty (Aphrodite) has been nerfed to have 3/6/9/12% dodge chance instead of starting at 4%
- Sleep (Hypnos) has been nerfed to only heal you in guardian encounters

## [1.0.0]

## [1.0.0] - 2025-12-03

### Added

- First version of the mod!

[unreleased]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.5.1...HEAD
[2.5.1]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.5.0...2.5.1
[2.5.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.4.1...2.5.0
[2.4.1]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.4.0...2.4.1
[2.4.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.3.4...2.4.0
[2.3.4]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.3.3...2.3.4
[2.3.3]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.3.2...2.3.3
[2.3.2]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.3.1...2.3.2
[2.3.1]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.3.0...2.3.1
[2.3.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.2.1...2.3.0
[2.2.1]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.2.0...2.2.1
[2.2.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.1.1...2.2.0
[2.1.1]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.1.0...2.1.1
[2.1.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/2.0.0...2.1.0
[2.0.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.5.1...2.0.0
[1.5.1]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.5.0...1.5.1
[1.5.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.4.6...1.5.0
[1.4.6]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.4.5...1.4.6
[1.4.5]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.4.4...1.4.5
[1.4.4]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.4.3...1.4.4
[1.4.3]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.4.2...1.4.3
[1.4.2]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.4.1...1.4.2
[1.4.1]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.4.0...1.4.1
[1.4.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.3.1...1.4.0
[1.3.1]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.3.0...1.3.1
[1.3.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.2.1...1.3.0
[1.2.1]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.2.0...1.2.1
[1.2.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.1.0...1.2.0
[1.1.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/Read-Em-And-Weep/Flip_the_Arcana_Mod/compare/989bef7e5384a70c59b37fc073c3de550998e7d0...1.0.0
