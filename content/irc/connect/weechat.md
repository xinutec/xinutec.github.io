Weechat
=======

Weechat is a ncurses based IRC client. It currently does not support assigning
a CA on a per per-network basis, so you will have to configure the Xinutec CA
as the global CA. This is a bug the author intends to fix within the next few
releases. See [this bug report](https://savannah.nongnu.org/task/?11357) for
status updates.

First, download the [CA certificate](../ca.crt). Save this under
`~/.weechat/xinutec.pem`

Then, set this as the default CA for all IRC networks as follows (alternatively
you can include it in your global CA certificate store if and only if you trust
us enough with this).

	/set weechat.network.gnutls_ca_file ~/.weechat/xinutec.pem

Now you can add the server:

	/server add xinutec irc.xinutec.net/6697 -ssl

You will need to reduce the minimum key size for Diffie-Hellman key exchange
because our DH-parameters are only 1024 bits at the moment.

	/set irc.server.xinutec.ssl_dhkey_size 1024

There are more flags than `-ssl`, most importantly also `-autoconnect`. See
`/help server` for more information.

Last but not least you can also mess around with the security parameters and
crypto algorithms used by weechat, most notably `sec.crypt.hash_algo` and
`sec.crypt.cipher`, although we suggest you should only do this if you know
your way around cryptography basics because the defaults are okay. 

Finally, connect the newly created server:

	/connect xinutec

See you there!

![Obligatory screenshot](screenshots/weechat1.png)
