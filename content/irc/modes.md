Special channel modes
=====================

These channel modes are somewhat unusual and provided by additional inspircd
modules, most of which are part of upstream inspircd however.

Auto-op
-------
You can set an auto-op mode on a channel with `+w o:z:$SHA`
where `$SHA` is the SHA-1 fingerprint of a given client certificate which can
be obtained by issuing `/whois` on a user. If there is no fingerprint listed
there, it means the user isn't connected using a client certificate. In this
case they can not use the method described here and should [generate a client
certificate first](ssl)

It may also be used to auto-voice certain clients with `+w v:z:$SHA`. Please
note that the "z" type reop ignores everything after a `#` character, so you
can affix a comment to it, e.g. `+w v:z:$SHA#Peter`, if Peter is the person
who owns the certificate belonging to this hash. SHA-1 fingerprints take the
form of 40 character hexadecimal numbers, i.e. 40 characters between 0-9 and
A-F.

Registering your channel
------------------------

While we do not provide nickname and channel as registration service packages
as most other networks do, you can request our staff to set channel mode `+P`
which makes modes and the topic on the channel permanent. Combined with the
auto-op mentioned above, this provides you with an advanced and
cryptographically secure way of regaining your channel after a disconnect. If
you want to unregister a channel, simply ask our staff to remove the mode
again.

Examples
--------

I believe examples are more descriptive than explaining everything in too much
detail, so here are some:

This mode gives people who are connected via SSL voice on join:

	/mode #foo +w v:z:*

This mode gives people with an SSL client certificate voice on join by checking
that the SSL fingerprint is at least one character long:

	/mode #foo +w v:z:?*

Ban people who are not connected via SSL (ban everybody, then make a ban
exemption for people who use SSL):

	/mode #foo +be *!*@* z:*

Only allow people with any SSL client certificate to join the channel:

	/mode #foo +be *!*@* z:?*

Ban a user with a certain SSL client certificate from this channel (consider
the all-zero fingerprint an example value for a SHA-1 fingerprint)

	/mode #foo +b z:0000000000000000000000000000000000000000

Please note that they can just generate a different SSL client certificate so
banning everybody and whitelisting a select few people using `+e` and their
respective fingerprint is a better approach in this case.

Automatically voice somebody by fingerprint:

	/mode #foo +w v:z:0000000000000000000000000000000000000000

Automatically give channel op status to somebody by fingerprint:

	/mode #foo +w o:z:0000000000000000000000000000000000000000
