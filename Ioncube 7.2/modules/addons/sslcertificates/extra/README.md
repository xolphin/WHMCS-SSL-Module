**********************************************

         *** Xolphin for WHMCS ***


Copyright © Xolphin BV 2002-2016
All Rights Reserved

**********************************************

SUPPORT:
----------------------------------------------
Need support? Please go to:
 - https://www.sslcertificaten.nl/support/

Module installation:
1.Unzip and upload the folders below into the directories:
a)Create directory sslcertificates in directory modules/servers of WHMCS directory and insert there content of Xolphin-Server.zip
b)Create directory sslcertificates in directory modules/addons of WHMCS directory and insert there content of WHMCS_Xolphin.zip
c)Create directory xolphin in WHMCS directory and insert there content of Xolphin-Core.zip
d)Insert configureproduct.tpl in directory templates/orderforms/boxes (or in the template you use as default on orderformes). Please note, that those additional fields will appear, on each order form where this template is used. Please, use for SSL products separate order tempalate.
e)Create directory overrides in directory lang and insert the there content of lang/overrides folder.
2.Login in the administrator area of your WHMCS. 
3.Hover the menu item "Setup" and click the sub menu item "Addon Modules".
4.Search for the addon "SSL certificates" and hit the activate button on the right side.
5.Enter API Username, API Password and API URL to connect to Xolphin system.
6.Put tick on checkbox "Use Debug Mode" to store all the logs from the module.
7.Choose the admin role groups to permit access to this module.
8.Now check the "Addons" section and find the module you have just installed.
9.Here you can also copy the CronJob link that will update statuses of certificates and install them.