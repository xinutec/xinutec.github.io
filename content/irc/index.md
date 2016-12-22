Internet Relay Chat
===================

We are very concerned with privacy, not for any dubious reasons, but simply
because we feel the need to protect our freedom of speech. It should be
obvious, but let's state it explicitly:

- our servers do not log any user messages
- we do not provide logger bots or host channel logs

SSL
---

Each of our servers is equipped with a certificate issued by the [Letsencrypt
Certificate Authority](https://letsencrypt.org/). You should verify the
certificate. Please see the menu on the left for client specific instructions.

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
