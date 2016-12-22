Common to purple based clients
==============================

Pidgin, Empathy and other libpurple based clients store the CA certificates in
a common place.

Pidgin
======

Next, add the IRC server to your client:

![Manage Accounts](screenshots/pidgin1.png)

Click "Add" in the "Manage Accounts" dialog and enter the following
information in the Basic tab:

![Add Account](screenshots/pidgin2.png)

Now, we need to tell Pidgin that we want to have an encrypted connection. Make
sure you change the port number to 6697 and check the SSL checkbox.

![SSL Settings](screenshots/pidgin3.png)

If you get the following message box, the installation of your CA certificate
store went wrong.

![Invalid Certificate](screenshots/pidgin4.png)

In that case, click "View Certificate", which will bring this information
window:

![Invalid Certificate](screenshots/pidgin5.png)

Copy the information and then click OK and accept and contact a staff member
to help solve the problem.
