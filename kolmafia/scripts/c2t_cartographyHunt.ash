//c2t
//c2t_cartographyHunt
// handles the Map the Monsters non-combat adventure and places player in the combat that follows
// loc is target location
// mon is target monster
// returns whether the combat was entered after the correct non-combat adventure or not
// uses Map the Monsters skill as needed
// aborts in the non-combat adventure if the loc and mon pair is invalid
// aborts if something other than correct non-combat adventure is encountered
boolean c2t_cartographyHunt(location loc,monster mon) {
	if (have_skill($skill[Map the Monsters]) && get_property('mappingMonsters') == 'false' && get_property('_monstersMapped').to_int() < 3)
		use_skill(1,$skill[Map the Monsters]);
	
	if (get_property('mappingMonsters') == 'true') {
		buffer buf;
		buf = visit_url(loc.to_url(),false,true);
		if (!buf.contains_text("Leading Yourself Right to Them"))
			abort("Wrong thing came up when using Map the Monsters at "+loc+" with "+mon);
		buf = visit_url("choice.php?pwd&whichchoice=1435&option=1&heyscriptswhatsupwinkwink="+mon.to_int(),true,true);
		if (!buf.contains_text("<b>Combat"))
			abort("Didn't enter combat using Map the Monsters at "+loc+" with "+mon);
		print("Should be in combat with "+mon);
		return true;
	}
	else if (get_property('_monstersMapped').to_int() == 3) {
		print("Ran out of Map the Monsters skill uses","blue");
		return false;
	}
	else if (!have_skill($skill[Map the Monsters])) {
		print("Map the Monsters skill not detected","blue");
		return false;
	}
	print("Something went wrong with Map the Monsters. Used some of the skill uses outside of mafia?","blue");
	return false;
}
