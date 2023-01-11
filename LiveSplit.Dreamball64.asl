state("DreamBall64")
{
	int currentLevel : 0x01313C0, 0x5E4, 0xB0;
	bool levelCompleted : 0x001FFA0, 0x264;
}

startup
{
	settings.Add("11", true, "Level 10");
	settings.Add("21", true, "Level 20");
	settings.Add("31", true, "Level 30");
	settings.Add("41", true, "Level 40");
	settings.Add("51", true, "Level 50");
	settings.Add("61", true, "Level 60");
	settings.Add("70", true, "Level 70");
}

onStart
{
	vars.previousLevel = 0;
	vars.onFinalLevel = false;
}

init
{
	vars.previousLevel = 0;
	vars.onFinalLevel = false;
}

start
{
	return current.currentLevel == 1;
}

split
{
	if (settings[current.currentLevel.ToString()] && vars.previousLevel != current.currentLevel && current.currentLevel != 70
	|| current.levelCompleted && current.currentLevel == 70 && settings[current.currentLevel.ToString()] && vars.previousLevel != current.currentLevel && vars.onFinalLevel) {
		vars.previousLevel = current.currentLevel;
		return true;
	}

	if (!current.levelCompleted && current.currentLevel == 70 && !vars.onFinalLevel) {
		vars.onFinalLevel = true;
	}
}

isLoading
{
}

exit
{
}