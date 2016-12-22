Irssi
=====

First, add the Xinutec network to your configuration with the following
command:

        /network add xinutec

[SSL client certificates](../channels/ssl) are our official way of registering channels
and handling channel access control. Please read this article along with the
[article on channel modes](../channels/modes) before continuing with the irssi specific
instructions if you're interested in being a channel operator. Otherwise,
continue with the instructions on connecting without a client certificate.

Without client certificate, enter this command, all on one line:

        /server add -ssl_verify -auto -network xinutec irc.xinutec.net 6697

In case you do have a client certificate with associated private key, save
them both in `~/.irssi/client.pem` by concatenating them with the following
shell-command:

	cat key.pem cert.pem > ~/.irssi/client.pem

and use the following irssi command, again all on one line:

        /server add -ssl_cert ~/.irssi/client.pem -ssl_verify
                    -auto -network xinutec irc.xinutec.net 6697

If you aren't sure what these flags do, take a look at `/help server`

In case you already registered the network and server in your client, you can
either remove the server with `/server remove irc.xinutec.net` and re-add it
as above, or manually edit the configuration file `~/.irssi/config` using your
favourite text editor, so that it contains a section like this in the servers
list:

        {
          address = "irc.xinutec.net";
          chatnet = "xinutec";
          port = "6697";
          ssl_cert = "~/.irssi/client.pem";
          autoconnect = "yes";
        },

If you don't want to use a client certificate, simply remove the line that
starts with `ssl_cert`.
