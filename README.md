# c2t_cartographyHunt

Kolmafia function to handle the choice adventure from the Map the Monsters skill, leaving the player in the combat.

`svn checkout https://github.com/c2talon/c2t_cartographyHunt/branches/master/kolmafia/`

## Usage

`import` this script to use its function to handle the choice adventure for the Map the Monsters skill. This will leave the player in the combat with the desired monster if all goes well.

`boolean c2t_cartographyHunt(location loc,monster mon)`
* `loc` must be a valid location
* `mon` must be a valid monster
* returns whether combat was entered after the correct non-combat adventure or not
* will automatically use the Map the Monsters skill if needed
* aborts in the non-combat adventure if the `loc` and `mon` pair is invalid
* aborts if something other than correct non-combat adventure is encountered, such as a wanderer or superlikely
