state("DreamBall64")
{
	int currentLevel : 0x0132474, 0x58, 0x60, 0x17C, 0xB34, 0xA8;
}

startup
{
	settings.Add("10", true, "Level 10");
	settings.Add("20", true, "Level 20");
	settings.Add("30", true, "Level 30");
	settings.Add("40", true, "Level 40");
	settings.Add("50", true, "Level 50");
	settings.Add("60", true, "Level 60");
	settings.Add("70", true, "Level 70");
}

onStart
{
	vars.previousLevel = 0;
}

init
{
	vars.previousLevel = 0;
}

start
{
	return current.currentLevel == 1;
}

split
{
	var previousLevel = vars.previousLevel;
	if (settings[current.currentLevel.ToString()] && previousLevel != current.currentLevel) {
		vars.previousLevel = current.currentLevel;
		return true;
	}
}

isLoading
{
}

exit
{
}
