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
orthogonal to anonymity, and as such, we provide full support for client
certificates. You can set an auto-op mode on a channel with `+w o:z:$SHA`
where `$SHA` is the SHA-1 fingerprint of a given client certificate which can
be obtained by issuing `/whois` on a user. If there is no fingerprint listed
there, it means the user isn't connected using a client certificate. This way,
you can also check whether your client certificate works for yourself). It may
also be used to auto-voice certain clients with `+w v:z:$SHA`. Please note that
the "z" type reop ignores everything after a `#` character, so you can affix a
comment to it, e.g. `+w v:z:$SHA#Peter`, if Peter is the person who owns the
certificate belonging to this hash. SHA-1 fingerprints take the form of 40
character hexadecimal numbers, i.e. 40 characters between 0-9 and A-F.

Registering your channel
------------------------

While we do not provide nickname and channel as registration service packages
as most other networks do, users can set channel mode `+P` which makes modes
and the topic on the channel permanent. Combined with the auto-op mentioned
above, this provides you with an advanced and cryptographically secure way of
regaining your channel after a disconnect. If you want to unregister a channel,
simply remove mode `-P` again.

Off-the-record messaging
------------------------

In case you are concerned that an attacker may compromise one of our servers
and record pre-encryption traffic (since servers must decrypt traffic before
re-encrypting it with the recipient's session key), we recommend establishing
end-to-end encryption with [OTR](http://www.cypherpunks.ca/otr/).
