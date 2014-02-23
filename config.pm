{
	name			=> 'Xinutec Network',
	slogan		=> "Xinutec's place on the web",
	shortname	=> 'Xinutec',
	copyright	=> 'Xinutec Research Labs',

	menubar => [
		["Home"],
		[irc => "IRC", [
			[connect	=> "Connecting", [
				[irssi		=> "Irssi"],
				[pidgin	=> "Pidgin"],
				[weechat	=> "Weechat"]
			]],
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

# vim:noexpandtab tabstop=2
