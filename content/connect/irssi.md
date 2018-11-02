Irssi
=====

First, add the Xinutec network to your configuration with the following
command:

        /network add xinutec
        
If you want to just connect to the network, enter the following command:

        /server add -ssl_verify -auto -network xinutec irc.xinutec.net 6697

This will add the server and connect to it automatically whenever irssi is
started (because of `-auto`). In order to add the changes to your config file, you need to use

        /save

As the last step, you probably want to connect to the network:

        /connect xinutec
        
All done!

Here's an example of what the default configuration of irssi looks like:

<asciinema-player src="asciinema/irssi.cast" theme="tango"></asciinema-player>


Using a client certificate
--------------------------

This is only required if you want to register your channels because you're a
channel operator.

[SSL client certificates](../channels/ssl) are our official way of registering
channels and handling channel access control. Please read this article along
with the [article on channel modes](../channels/modes) before continuing with
the irssi specific instructions below.

Assuming you followed the instructions linked above, you now have a client
certificate with associated private key, so save them both in
`~/.irssi/client.pem` by concatenating them with the following shell-command:

	cat key.pem cert.pem > ~/.irssi/client.pem

and use the following irssi command, all on one line:

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

If you later decide that you don't want to use a client certificate, simply
remove the line that starts with `ssl_cert`.
