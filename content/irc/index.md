Internet Relay Chat
===================

We are very concerned with privacy, not for any dubious reasons, but simply
because we feel the need to protect our freedom of speech. It should be
obvious, but let's state it explicitly:

- our servers do not log any user messages
- we do not provide logger bots or host channel logs

We also do not endorse other people doing so. We do provide a publicly
accessible [quotes](http://quotes.xinutec.net) database, but a quote may only
be added with consent of all people involved.

SSL
---

Each of our servers is equipped with a certificate issued by the Xinutec IRC
Certificate Authority. We recommend downloading and installing the authority's
[CA certificate](ca.crt) to verify the server's identity. If your client
supports CRLs (certificate revocation lists), you may additionally link it to
the [CRL](crl.pem). In general, you would not download the CRL, as it can
change. The CA certificate, on the other hand, *should* be downloaded, as it
may never change. If it does, that means it was compromised. If this happens
to you, please contact one of our administrators as soon as possible.

Anonymity and authentication
----------------------------

We understand that some people may want to remain anonymous, so the use of
real names is not required on the Xinutec IRC network. Authentication is not
orthogonal to anonymity, and as such, we provide full support for [SSL client
certificates](ssl). You can use them in conjunction with [network specific
channel modes](modes) to automatically set certain modes upon channel join.
This way, a cryptographically secure channel registration method is available
on this network.

Off-the-record messaging
------------------------

In case you are concerned that an attacker may compromise one of our servers
and record pre-encryption traffic (since servers must decrypt traffic before
re-encrypting it with the recipient's session key), we recommend establishing
end-to-end encryption with [OTR](http://www.cypherpunks.ca/otr/).
