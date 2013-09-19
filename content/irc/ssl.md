SSL client certificates
=======================

SSL client certificates allow us to identify you by your certificate's fingerprint.
This is a cryptographically secure way to identify people (well, at least
certificates that belong to people) so that channel owership and access control
isn't as hard anymore as it used to be back when the only access control
mechanism in IRC were hostmasks.

It also allows us to have service-like channel registration without actually
running a services package, i.e. no service-like bots like NickServ, ChanServ
etc. exist on this network.

Getting started
---------------

You will need to generate a SSL private key and certificate (a self-signed one
will do, so you won't even have to deal with certification authorities).

You can either use `openssl(1)` (should be available just about everywhere)
or you can use `certtool(1)` from the gnutls package (gnutls-bin on debian).
We will use openssl because it is assumed to be more widespread.

	$ openssl genrsa -out key.pem 4096 # generate the private key
	$ openssl req -new -x509 -key key.pem -out cert.pem -days 1095 # and the certificate

During the certificate creation process, openssl will ask you a couple of
questions. If you don't know the answer to those, just leave them blank and
press enter to use the default value since the IRC server does not validate
them anyway.

This process will generate a private RSA key with a length of 4096 bits and a
certificate that will be valid for 1095 days, which is 3 years. You can replace
the number by a higher one or leave `-days x` out entirely as you deem fit to
make your certificate valid until the end of time or SSL, whichever comes first.

You can also adjust the key size, i.e. replace the 4096 by a different number
but please note that keys smaller than 2048 bits are considered unsafe by
modern standards and keys greater than 8192 might not work with all software
(in particular, apple computers seem to have a problem with them).

Using the certificate with your client
--------------------------------------

This list is obviously incomplete since there are lots of clients.
If you use a client that isn't mentioned here, please help us help you and
write a guide ;)

## irssi

Irssi supports having both the key and certificate in a single file, so you can
append them together, first the key, then the certificate, and place it into
`~/.irssi`:

	$ cat key.pem cert.pem > ~/.irssi/combined.pem

While you're at it, you should also place our CA certificate next to it:

	$ wget -O ~/.irssi/xinutec-ca.crt http://xinutec.net/home/irc/ca.crt

If you want, you can verify the certificate's fingerprint now by checking the
output of the following command:

	$ openssl x509 -noout -in ~/.irssi/xinutec-ca.crt -fingerprint -sha1 
	SHA1 Fingerprint=65:79:0D:72:C7:5B:81:11:9F:71:2B:AD:93:79:58:EA:2A:18:93:11

If the fingerprint value doesn't match the one mentioned here, someone has
tampered with the CA certificate. In this case, please inform the network
staff.

Now place combined.pem in ~/.irssi and execute the following commands in irssi:

	/network add Xinutec
	/server add -network Xinutec -ssl -ssl_cert ~/.irssi/combined.pem -ssl_verify -ssl_cafile ~/.irssi/xinutec-ca.crt irc.xinutec.net 6697

## eggdrop

You need the current development version of eggdrop (1.8.x prerelease from CVS)
for SSL support. Earlier versions of eggdrop support neither IPv6 nor SSL.


Verifying that your certificate works
-------------------------------------

Once you have generated the key and certificate and set up your client to use
them, you will need to reconnect because the certificate is only sent when a
connection is established. You can `/whois` your own nick to verify if it
worked; if you see something according the lines of 

	* is using a secure connection
	* has client certificate fingerprint 0847d42c2c266bb9faaff55320c5a453a71fac43

in the whois output, this means that your attempt at installing a fingerprint
was successful.
