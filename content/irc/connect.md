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

Without client certificate, follow these instructions:

```
/server add -ssl_cafile ~/.irssi/xinutec.pem -auto -network xinutec irc.xinutec.net
```

In case you do have a client certificate with associated private key, save
them both in `~/.irssi/client.pem` and use the following command:

```
/server add -ssl_cafile ~/.irssi/xinutec.pem -ssl_cert ~/.irssi/client.pem -auto -network xinutec irc.xinutec.net
```
