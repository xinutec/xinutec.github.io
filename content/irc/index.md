Internet Relay Chat
===================

We are very concerned with privacy, not for any dubious reasons, but simply
because we feel the need to protect our freedom of speech.

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
real names is not required on the Xinutec IRC network.
