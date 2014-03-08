Connecting to IRC
=================

This category provides short explanations on how to add the Xinutec IRC Network
to your IRC client and how to connect to it. If your client is not listed here,
but you would like to add a short how-to, perhaps with screenshots, feel free
to contact our staff.

Please see the menu on the left side for a list of clients for which
documentation currently exists.

The first step for all clients is to download and verify the CA certificate.
You can download the certificate with wget or you can just save it by some
other means as `xinutec-ca.crt` in the current directory.

	$ wget http://xinutec.net/home/irc/ca.crt -O xinutec-ca.crt
	[wget downloading output omitted]

Now please check it against the output of the following command:

	$ openssl x509 -noout -in xinutec-ca.crt -fingerprint -sha1 
	SHA1 Fingerprint=65:79:0D:72:C7:5B:81:11:9F:71:2B:AD:93:79:58:EA:2A:18:93:11

If the fingerprint value doesn't match the one mentioned here, someone has
tampered with the CA certificate. In this case, please inform the network
staff.
