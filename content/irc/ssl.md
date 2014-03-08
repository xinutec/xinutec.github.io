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
will do, so you won't even have to deal with certification authorities, however
if you use S/MIME for encrypting or signing e-mail, you can also just reuse the
private key and certificate and save yourself some time).

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
(in particular, Apple computers seem to have a problem with them).

UNIX-like operating systems like Linux, \*BSD and Mac OS X typically have the
openssl commandline tool already installed.

Windows users will need to [download the OpenSSL Win32 binaries][openssl-win32]
or [Microsoft's makecert.exe][makecert-win32] and use the Windows command
prompt to generate certificates since Windows itself does not ship a tool for
generating certificates. Alternatives include using IIS or Microsoft Visual
Studio to generate certificates, if you have them installed.

Verifying that your certificate works
-------------------------------------

Assuming you already configured your IRC client to use the certificate
according to the [client specific instructions](connect) and reconnected
(because the certificate is only transmitted when a connection is made), you
can `/whois` your own nick to verify if it worked. If you see something like
this

	* is using a secure connection
	* has client certificate fingerprint 0847d42c2c266bb9faaff55320c5a453a71fac43

in the whois output, this means that your attempt at installing a client
certificate was successful.

You can also find out about your own certificate's fingerprint by using the
openssl command mentioned above:

	$ openssl x509 -noout -in ~/.irssi/combined.pem -fingerprint -sha1
	SHA1 Fingerprint=08:47:D4:2C:2C:26:6B:B9:FA:AF:F5:53:20:C5:A4:53:A7:1F:AC:43

Please note that you need to strip all colons from this value to format it in a
way the IRC server can use it for features like auto-op:

	$ openssl x509 -noout -in ~/.irssi/combined.pem -fingerprint -sha1 | sed 's/.*=//;s/://g'
	0847D42C2C266BB9FAAFF55320C5A453A71FAC43

This way you can easily copy-paste it whenever you need it.

Using the certificate fingerprint to automatically set modes
------------------------------------------------------------

This is described [in a separate article](modes).

[openssl-win32]:  https://www.openssl.org/related/binaries.html
[makecert-win32]: http://msdn.microsoft.com/en-us/library/bfsktky3%28v=vs.110%29.aspx
