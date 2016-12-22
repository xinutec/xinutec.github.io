{
	name			=> 'Xinutec Network',
	slogan		=> "a virtual hackerspace",
	shortname	=> 'Xinutec',
	copyright	=> 'Xinutec Research Labs',

	menubar => [
		["Home"],
		[connect	=> "Connecting", [
			[irssi		=> "Irssi"],
			[pidgin		=> "Pidgin"],
			[weechat	=> "Weechat"]
		]],
		[channels => "Channels", [
			[modes => "Channel Modes"],
			[ssl => "Client certificates"],
			[linux => "#linux"],
		]],
		[people => "People"],
		[dev => "Software", [
			[contributing => "Contributing"],
			[cla => "CLA"],
		]],
		[contact => "Contact"],
	],
}

# vim:noexpandtab tabstop=2
