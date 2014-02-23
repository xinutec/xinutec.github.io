Common to purple based clients
==============================

Pidgin, Empathy and other libpurple based clients store the CA certificates in
a common place.

Our Xinutec [CA certificate](../ca.crt) should be saved in the global CA store.
Save it as `Xinutec_CA.pem` under `/usr/share/purple/ca-certs` (or
`/usr/local/share/purple/ca-certs` as appropriate). Under Windows, save it
under `C:\Program Files\Pidgin\ca-certs` (or `C:\Program Files
(x86)\Pidgin\ca-certs` as appropriate).

Pidgin
======

Refer to the above section about purple clients for the CA certificate.

Next, add the IRC server to your client:

![Manage Accounts](screenshots/pidgin1.png)

Click "Add" in the "Manage Accounts" dialog and enter the following
information in the Basic tab:

![Add Account](screenshots/pidgin2.png)

Now, we need to tell Pidgin that we want to have an encrypted connection. Make
sure you change the port number to 6697 and check the SSL checkbox.

![SSL Settings](screenshots/pidgin3.png)

If you get the following message box, the installation of our CA certificate
went wrong.

![Invalid Certificate](screenshots/pidgin4.png)

In that case, click "View Certificate", which will bring this information
window:

![Invalid Certificate](screenshots/pidgin5.png)

Copy the information and then click OK and accept and contact a staff member
to help solve the problem.
