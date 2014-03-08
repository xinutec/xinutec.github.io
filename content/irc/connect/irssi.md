Irssi
=====

First, download the [CA certificate](../ca.crt). Save this under
`~/.irssi/xinutec.pem`. Then, add the Xinutec network to your configuration
with the following command:

        /network add xinutec

Without client certificate, enter this command, all on one line:

        /server add -ssl_cafile ~/.irssi/xinutec.pem
                    -auto -network xinutec irc.xinutec.net 6697

In case you do have a client certificate with associated private key, save
them both in `~/.irssi/client.pem` and use the following command, again all on
one line:

        /server add -ssl_cafile ~/.irssi/xinutec.pem
                    -ssl_cert ~/.irssi/client.pem
                    -auto -network xinutec irc.xinutec.net 6697

In case you already registered the network and server in your client, you can
either remove the server with `/server remove irc.xinutec.net` and re-add it
as above, or manually edit the configuration file, so that it contains a
section like this:

        {
          address = "irc.xinutec.net";
          chatnet = "xinutec";
          port = "6697";
          ssl_cert = "~/.irssi/client.pem";
          ssl_cafile = "~/.irssi/xinutec.pem";
          autoconnect = "yes";
        },


Connecting with a client certificate
------------------------------------

[SSL client certificates](../ssl) are our official way of registering channels
and handling channel access control. Please read this article along with the
[article on channel modes](../modes) before continuing with the irssi specific
instructions. This document assumes that you generated a private key and a
client certitifate and saved them in the files `key.pem` and `cert.pem` in the
current directory.

Irssi supports having both the key and certificate in a single file, so you can
append them together, first the key, then the certificate, and place the
concatenated file in your `~/.irssi` directory:

	$ cat key.pem cert.pem > ~/.irssi/combined.pem

Now execute the following commands in irssi:

	/network add Xinutec
	/server add -auto -network Xinutec -ssl -ssl_cert ~/.irssi/combined.pem -ssl_verify -ssl_cafile ~/.irssi/xinutec-ca.crt irc.xinutec.net 6697

If you aren't sure what these flags do, take a look at `/help server`

Alternatively, if you prefer editing the config file, e.g. because you already
have added a server entry for Xinutec like above but want to add a client
certificate now, you can put something along the lines of

	{
	  address = "irc.xinutec.net";
	  chatnet = "Xinutec";
	  port = "6697";
	  ssl_cert = "~/.irssi/combined.pem";
	  ssl_cafile = "~/.irssi/xinutec-ca.crt";
	  autoconnect = "yes";
	},

to the servers list in `~/.irssi/config` using your favourite text editor.
