{
	name			=> 'Xinutec Network',
	slogan		=> "Xinutec's place on the web",
	shortname	=> 'Xinutec',

	menubar => [
		["Home"],
		[irc => "IRC", [
			[connect => "Connecting"],
			[rules => "Rules"],
			[modes => "Modes"],
			[ssl => "SSL"],
		]],
		[dev => "Software", [
			[contributing => "Contributing"],
			[cla => "CLA"],
		]],
		[contact => "Contact"],
	],
}

# vim:noexpandtab
