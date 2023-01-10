state("DreamBall64")
{
	int currentLevel : 0x01313C0, 0x5E4, 0xB0;
	bool levelCompleted : 0x001FFA0, 0x264;
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
	if (settings[current.currentLevel.ToString()] && vars.previousLevel != current.currentLevel && current.currentLevel != 70) {
		vars.previousLevel = current.currentLevel;
		return true;
	} else if (current.levelCompleted && current.currentLevel == 70 && vars.previousLevel != current.currentLevel) {
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
