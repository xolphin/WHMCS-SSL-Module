# Xolphin WHMCS SSL Module

The Xolphin WHMCS module allows your customers to order SSL Certificates from within WHMCS. The certificates are automatically installed on Plesk, DirectAdmin and cPanel.

### Module Import

To import the module, several files will need to be added to WHMCS. All required files are available on GitHub. Follow the next steps to complete the import:

1. Upload the **modules** and **xolphin** folders directly into the WHMCS root folder. This will add the modules to **modules/addons/sslcertificates** and **modules/servers/sslcertificates** and add the **xolphin** folder directly into the WHMCS root folder.
2. Upload the **configureproduct.tpl** file to **templates/orderforms/<yourtemplate>/**. Replace **<yourtemplate>** by the folder name of the template you currently use. If multiple templates are used, the file should be added into each of them.

### Module Activation

1. With WHMCS go to **Setup->Addon Modules**.
2. Search for the **SSL Certificates** module and click **Activate**.
3. Click on **Configure**. 
4. Enter your Xolphin username and password in the **API Username** and **API Password** fields.
5. At **URL API** add our current API URL: https://api.xolphin.com/v1/
6. Make sure that the currect user accounts have access to the module, by selecting the desired **Access Control options**.
7. If you wish to log more details concerning the module, you can activate **Debug Mode**. This may be helpful in case of any problems

### Import Products

1. Click on **Addons->SSL Certificates**, followed by I want to install products automatically. Afterwards click on **Install**
2. The products have now been imported. Using **Setup->Products** you may change and view any product as desired.
