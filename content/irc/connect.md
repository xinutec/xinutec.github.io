Connecting to IRC
=================

This page provides short explanations on how to add the Xinutec IRC Network to
your IRC client and how to connect to it. If your client is not listed here,
but you would like to add a short how-to, perhaps with screenshots, feel free
to contact our staff.

Irssi
-----

First, download the [CA certificate](ca.crt). Save this under
`~/.irssi/xinutec.pem`. Then, add the Xinutec network to your configuration
with the following command:

```
/network add xinutec
```

Without client certificate, enter this command, all on one line:

```
/server add -ssl_cafile ~/.irssi/xinutec.pem
            -auto -network xinutec irc.xinutec.net
```

In case you do have a client certificate with associated private key, save
them both in `~/.irssi/client.pem` and use the following command, again all on
one line:

```
/server add -ssl_cafile ~/.irssi/xinutec.pem
            -ssl_cert ~/.irssi/client.pem
            -auto -network xinutec irc.xinutec.net
```

In case you already registered the network and server in your client, you can
either remove the server and re-add it as above, or manually edit the
configuration file, so that it contains a section like this:

```
  {
    address = "irc.xinutec.net";
    chatnet = "xinutec";
    port = "6697";
    ssl_cert = "~/.irssi/client.pem";
    ssl_cafile = "~/.irssi/xinutec.pem";
    autoconnect = "yes";
  },
```
