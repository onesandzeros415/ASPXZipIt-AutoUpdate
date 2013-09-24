<%@ Page Language="C#" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Xml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script runat="server">

    //ASPXZipIt Designed and Mainted By: Matthew Costello, 1/28/2013, San Antonio, Texas.
    //Updated to v2 : 9/19/2013

    protected static string path = HttpContext.Current.Server.MapPath("~\\");
    protected static string rootwebConfigPath = HttpContext.Current.Server.MapPath("~\\Web.config");

    protected static string aspxZipItInstaller = "\\ASPXZipIt-Installer.aspx";
    protected static string fileName1 = "\\users.xml";
    protected static string fileName2 = "\\Ionic.Zip.dll";
    protected static string fileName3 = "\\ASPXZipIt-NET35.dll";
    protected static string fileName4 = "\\ASPXZipIt-NET40.dll";
    protected static string fileName5 = "\\ASPXZipIt-NET45.dll";
    protected static string fileName6 = "\\OpenStack.Swift.dll";
    protected static string fileName7 = "\\Rackspace.Cloudfiles.dll";
    protected static string fileName19 = "\\Newtonsoft.Json.dll";
    protected static string fileName20 = "\\openstacknet.dll";
    protected static string fileName21 = "\\SimpleRESTServices.dll";
    protected static string fileName8 = "\\Default.aspx";
    protected static string fileName26 = "\\Site.Master";
    protected static string fileName9 = "\\zipit-db.aspx";
    protected static string fileName10 = "\\zipit-logs.aspx";
    protected static string fileName11 = "\\zipit-login.aspx";
    protected static string fileName12 = "\\zipit-settings.aspx";
    protected static string fileName13 = "\\zipit-success.aspx";
    protected static string fileName14 = "\\Web.config";
    protected static string fileName15 = "\\DBResultPage.aspx";
    protected static string fileName16 = "\\ResultPage.aspx";
    protected static string fileName18 = "\\style.css";
    protected static string fileName17 = "\\progress.gif";
    protected static string fileName22 = "\\background.jpg";
    protected static string fileName23 = "\\logout.png";
    protected static string fileName24 = "\\settings.png";
    protected static string fileName25 = "\\aspxzipit.js";

    protected static string assets_css_jqery_ui = "jquery-ui.css";
    protected static string assets_css_imgs_1 = "animated-overlay.gif";
    protected static string assets_css_imgs_2 = "ui-bg_flat_55_999999_40x100.png";
    protected static string assets_css_imgs_3 = "ui-bg_flat_75_aaaaaa_40x100.png";
    protected static string assets_css_imgs_4 = "ui-bg_glass_0_0078ae_1x400.png";
    protected static string assets_css_imgs_5 = "ui-bg_glass_0_79c9ec_1x400.png";
    protected static string assets_css_imgs_6 = "ui-bg_glass_0_f8da4e_1x400.png";
    protected static string assets_css_imgs_7 = "ui-bg_gloss-wave_0_6eac2c_500x100.png";
    protected static string assets_css_imgs_8 = "ui-bg_gloss-wave_0_2191c0_500x100.png";
    protected static string assets_css_imgs_9 = "ui-bg_gloss-wave_0_e14f1c_500x100.png";
    protected static string assets_css_imgs_10 = "ui-bg_inset-hard_0_fcfdfd_1x100.png";
    protected static string assets_css_imgs_11 = "ui-icons_056b93_256x240.png";
    protected static string assets_css_imgs_12 = "ui-icons_0078ae_256x240.png";
    protected static string assets_css_imgs_13 = "ui-icons_d8e7f3_256x240.png";
    protected static string assets_css_imgs_14 = "ui-icons_e0fdff_256x240.png";
    protected static string assets_css_imgs_15 = "ui-icons_f5e175_256x240.png";
    protected static string assets_css_imgs_16 = "ui-icons_f7a50d_256x240.png";
    protected static string assets_css_imgs_17 = "ui-icons_fcd113_256x240.png";
    protected static string assets_js_jquery = "jquery-1.10.2.js";
    protected static string assets_js_jquery_ui = "jquery-ui-1.10.3.custom.js";

    protected static string installerPath_AppData = path + "App_Data";
    protected static string installerPath_bin = path + "bin";
    protected static string installerPath_aspxzipit = path + "aspxzipit";
    protected static string installerPath_progress = path + "aspxzipit" + "\\Progress";
    protected static string installerPath_assets = path + "aspxzipit" + "\\assets";
    protected static string installerPath_css = path + "aspxzipit" + "\\assets" + "\\css";
    protected static string installerPath_css_images = path + "aspxzipit" + "\\assets" + "\\css\\images";
    protected static string installerPath_images = path + "aspxzipit" + "\\assets" + "\\images";
    protected static string installerPath_js = path + "aspxzipit" + "\\assets" + "\\js";
    protected static string installerPath_sqlbak = path + "aspxzipit_sql_bak";
    protected static string installerpath_update_backup = path + "aspxzipit_backup";

    //ASPXZipIt Designed and Mainted By: Matthew Costello, 1/28/2013, San Antonio, Texas.

    protected static string backupusersxml = "\\users.xml";
    protected static string backupaspxzipitwebconfig = "\\Web.config";
    protected static string autoupdate = "\\zipit-autoupdate.aspx";
    protected static string cfusername = "CloudFilesUserName";
    protected static string cfpasswd = "CloudFilesApiKey";
    protected static string cfsnet = "snet";

    protected void Page_Load(object sender, EventArgs e)
    {
        string DotNetVersion = Request.QueryString["DotNetVersion"];

        string path = Server.MapPath("~\\");

        string installerpath_App_Data = path + "App_Data";
        string installerpath_update_backup = path + "aspxzipit_backup";
        string installerpath_bin = path + "bin";
        string installerpath_aspxzipit = path + "aspxzipit";
        string installerpath_progress = path + "aspxzipit" + "\\Progress";
        string installerpath_images = path + "aspxzipit" + "\\Images";
        string installerpath_styles = path + "aspxzipit" + "\\styles";
        string installerpath_sqlbak = path + "aspxzipit_sql_bak";

        string gitHubDotNetVersion35 = "ASPXZipIt-NET35";
        string gitHubDotNetVersion40 = "ASPXZipIt-NET40";
        string gitHubDotNetVersion45 = "ASPXZipIt-NET45";

        string LogResults1 = "  AspxZipIt update has begun.                                                     \r\n";
        string LogResults2 = "  The folloing temp directory has been created : " + installerpath_update_backup + "                                                     \r\n";
        string LogResults3 = "  ASPXZipIt settings have been successfully backed up to : " + installerPath_AppData + backupusersxml + "                                           \r\n";
        string LogResults4 = "  ASPXZipIt settings have been successfully restored to : " + installerPath_aspxzipit + "\r\n";
        string LogResults5 = "  AspxZipIt has been successfully update to:" + path + "           \r\n";
        string LogResults6 = "  ASPXZipIt is complete and has been successfully updated!                                              \r\n";

        try
        {
            if (DotNetVersion == "35")
            {
                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults1);

                Directory.CreateDirectory(installerpath_update_backup);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults2);

                backupExisitingAspxZipitSettings();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults3);

                downloadAspxZipIt(gitHubDotNetVersion35);

                restoreAspxZipitSettings();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults4);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults5);

                removeUpdater();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults6);

                Response.Redirect("/aspxzipit/zipit-logs.aspx");
            }
            else if (DotNetVersion == "40")
            {
                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults1);

                Directory.CreateDirectory(installerpath_update_backup);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults2);

                backupExisitingAspxZipitSettings();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults3);

                downloadAspxZipIt(gitHubDotNetVersion40);

                restoreAspxZipitSettings();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults4);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults5);

                removeUpdater();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults6);

                Response.Redirect("/aspxzipit/zipit-logs.aspx");
            }
            else if (DotNetVersion == "45")
            {
                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults1);

                Directory.CreateDirectory(installerpath_update_backup);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults2);

                backupExisitingAspxZipitSettings();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults3);

                downloadAspxZipIt(gitHubDotNetVersion45);

                restoreAspxZipitSettings();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults4);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults5);

                removeUpdater();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults6);

                Response.Redirect("/aspxzipit/zipit-logs.aspx");
            }
            else
            {
                lblInfo.Text = "In order for Auto Update to function you must tell it what version of .NET you are using.";
            }
        }
        catch (Exception ex)
        {
            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + ex.ToString());
        }
    }
    //Download ASPXZipIt from GitHub
    protected void downloadAspxZipIt(string dotNetVersion)
    {
        string LogResults1 = "  AspxZipIt has been successfully removed : ";
        string LogResults2 = "  AspxZipIt download has begun.                                                     \r\n";
        string LogResults3 = "  AspxZipIt has been successfully downloaded to:" + installerPath_aspxzipit + "           \r\n";

        //Setup source github urls
        List<string> src = new List<string>();
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/Default.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/Site.Master");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-db.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-logs.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-login.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-settings.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-success.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/Web.config");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/Progress/DBResultPage.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/Progress/ResultPage.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/style.css");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/images/progress.gif");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/images/background.jpg");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/images/logout.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/images/settings.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/js/aspxzipit.js");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/jquery-ui.css");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/animated-overlay.gif");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-bg_flat_55_999999_40x100.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-bg_flat_75_aaaaaa_40x100.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-bg_glass_0_0078ae_1x400.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-bg_glass_0_79c9ec_1x400.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-bg_glass_0_f8da4e_1x400.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-bg_gloss-wave_0_6eac2c_500x100.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-bg_gloss-wave_0_2191c0_500x100.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-bg_gloss-wave_0_e14f1c_500x100.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-bg_inset-hard_0_fcfdfd_1x100.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-icons_056b93_256x240.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-icons_0078ae_256x240.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-icons_d8e7f3_256x240.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-icons_e0fdff_256x240.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-icons_f5e175_256x240.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-icons_f7a50d_256x240.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/ui-icons_fcd113_256x240.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/js/jquery-1.10.2.js");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/images/js/jquery-ui-1.10.3.custom.js");

        //Setup destination install list
        List<string> dst = new List<string>();
        dst.Add(@installerPath_aspxzipit + fileName8);
        dst.Add(@installerPath_aspxzipit + fileName26);
        dst.Add(@installerPath_aspxzipit + fileName9);
        dst.Add(@installerPath_aspxzipit + fileName10);
        dst.Add(@installerPath_aspxzipit + fileName11);
        dst.Add(@installerPath_aspxzipit + fileName12);
        dst.Add(@installerPath_aspxzipit + fileName13);
        dst.Add(@installerPath_aspxzipit + fileName14);
        dst.Add(@installerPath_progress + fileName15);
        dst.Add(@installerPath_progress + fileName16);
        dst.Add(@installerPath_css + fileName18);
        dst.Add(@installerPath_images + fileName17);
        dst.Add(@installerPath_images + fileName22);
        dst.Add(@installerPath_images + fileName23);
        dst.Add(@installerPath_images + fileName24);
        dst.Add(@installerPath_js + fileName25);
        dst.Add(@installerPath_css + assets_css_jqery_ui);
        dst.Add(@installerPath_css_images + assets_css_imgs_1);
        dst.Add(@installerPath_css_images + assets_css_imgs_2);
        dst.Add(@installerPath_css_images + assets_css_imgs_3);
        dst.Add(@installerPath_css_images + assets_css_imgs_4);
        dst.Add(@installerPath_css_images + assets_css_imgs_5);
        dst.Add(@installerPath_css_images + assets_css_imgs_6);
        dst.Add(@installerPath_css_images + assets_css_imgs_7);
        dst.Add(@installerPath_css_images + assets_css_imgs_8);
        dst.Add(@installerPath_css_images + assets_css_imgs_9);
        dst.Add(@installerPath_css_images + assets_css_imgs_10);
        dst.Add(@installerPath_css_images + assets_css_imgs_11);
        dst.Add(@installerPath_css_images + assets_css_imgs_12);
        dst.Add(@installerPath_css_images + assets_css_imgs_13);
        dst.Add(@installerPath_css_images + assets_css_imgs_14);
        dst.Add(@installerPath_css_images + assets_css_imgs_15);
        dst.Add(@installerPath_css_images + assets_css_imgs_16);
        dst.Add(@installerPath_css_images + assets_css_imgs_17);
        dst.Add(@installerPath_js + assets_js_jquery);
        dst.Add(@installerPath_js + assets_js_jquery_ui);

        try
        {
            //Remove previous ASPX Zipit install
            System.IO.DirectoryInfo directory = new System.IO.DirectoryInfo(@installerPath_aspxzipit);
            Empty(directory, installerPath_aspxzipit);

            rebuildASPXZipitStructure();

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults1 + installerPath_aspxzipit + "\r\n");

            if (dotNetVersion == "ASPXZipIt-NET35")
            {
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/ASPXZipIt-NET35.dll");

                dst.Add(@installerPath_bin + fileName3);
            }
            else if (dotNetVersion == "ASPXZipIt-NET40")
            {
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/ASPXZipIt-NET40.dll");

                dst.Add(@installerPath_bin + fileName4);
            }
            else if (dotNetVersion == "ASPXZipIt-NET45")
            {
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/ASPXZipIt-NET45.dll");

                dst.Add(@installerPath_bin + fileName5);
            }

            // Setting up source and destination and creating a list of the file source and destination.
            List<KeyValuePair<string, string>> _srcdstList = new List<KeyValuePair<string, string>>();


            for (int i = 0; i < src.Count; i++)
            {
                string urlPath = src[i];
                string dstPath = dst[i];

                _srcdstList.Add(new KeyValuePair<string, string>(urlPath, dstPath));
            }

            StringBuilder downloadLoopSb = new StringBuilder();

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults2);

            // Just iterated through the list to issue 10 concurrent async file downloads
            foreach (KeyValuePair<string, string> fi in _srcdstList)
            {
                downloadLoopSb.Append(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + "  Downloading : " + fi.Key + "  |  Installing to :" + fi.Value + "\r\n");

                WebClient client = new WebClient();
                client.DownloadFile(fi.Key, fi.Value);
                client.Dispose();
            }

            EventLogReporting(downloadLoopSb);

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults3);
        }
        catch (Exception ex)
        {
            lblInfo.Text = "The process failed:" + ex.ToString();
        }
    }
    protected void backupExisitingAspxZipitSettings()
    {
        try
        {

            string path = Server.MapPath("~\\");
            string dir = "aspxzipit_backup\\";
            string filename = "Web.config";
            string absolutepath = Path.Combine(path, dir + filename);

            //Load xml with backed up ASPX Zipit settings 
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(installerPath_aspxzipit + fileName14);
            XmlNode cfUsername_node = xdoc.SelectSingleNode("/configuration/appSettings/add[@key='" + cfusername + "']");
            XmlNode cfPasswd_node = xdoc.SelectSingleNode("/configuration/appSettings/add[@key='" + cfpasswd + "']");
            XmlNode cfSnet_node = xdoc.SelectSingleNode("/configuration/appSettings/add[@key='" + cfsnet + "']");

            //Pull CloudFiles Username, Password, and Servicenet values from existing web.config
            string cfusername_config = cfUsername_node.Attributes["value"].Value;
            string cfpasswd_config = cfPasswd_node.Attributes["value"].Value;
            string cfsnet_config = cfSnet_node.Attributes["value"].Value;

            //Create new xml document with exisiting values prior to update
            XmlDocument doc = new XmlDocument();

            XmlDeclaration createXmlDecleration = doc.CreateXmlDeclaration("1.0", "UTF-8", "yes");
            XmlElement root = doc.CreateElement("configuration");
            XmlElement appSettings = doc.CreateElement("appSettings");
            XmlElement cloudfilesusername = doc.CreateElement("add");
            cloudfilesusername.SetAttribute("key", "CloudFilesUserName");
            cloudfilesusername.SetAttribute("value", cfusername_config);
            XmlElement cloudfilespasswd = doc.CreateElement("add");
            cloudfilespasswd.SetAttribute("key", "CloudFilesApiKey");
            cloudfilespasswd.SetAttribute("value", cfpasswd_config);
            XmlElement snet = doc.CreateElement("add");
            snet.SetAttribute("key", "snet");
            snet.SetAttribute("value", cfsnet_config);

            doc.AppendChild(createXmlDecleration);
            doc.AppendChild(root);
            root.AppendChild(appSettings);
            appSettings.AppendChild(cloudfilesusername);
            appSettings.AppendChild(cloudfilespasswd);
            appSettings.AppendChild(snet);

            Directory.CreateDirectory(Path.Combine(path, dir));
            doc.Save(absolutepath);
        }
        catch (Exception ex)
        {
            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + ex.ToString());
        }
    }
    protected void restoreAspxZipitSettings()
    {
        try
        {
            string path = Server.MapPath("~\\");
            string backupDir = "aspxzipit_backup\\";
            string backupFilename = "Web.config";
            string backupAbsolutepath = Path.Combine(path, backupDir + backupFilename);

            //Load xml with backed up ASPX Zipit settings 
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(backupAbsolutepath);
            XmlNode cfUsername_node = xdoc.SelectSingleNode("/configuration/appSettings/add[@key='" + cfusername + "']");
            XmlNode cfPasswd_node = xdoc.SelectSingleNode("/configuration/appSettings/add[@key='" + cfpasswd + "']");
            XmlNode cfSnet_node = xdoc.SelectSingleNode("/configuration/appSettings/add[@key='" + cfsnet + "']");

            //Convert value from  XmlAttribute to string
            string cfUsername_node_attributeValue = cfUsername_node.Attributes["value"].Value;
            string cfPasswd_node_attributeValue = cfPasswd_node.Attributes["value"].Value;
            string cfSnet_node_attributeValue = cfSnet_node.Attributes["value"].Value;

            //Update web.config with backedup settings
            updateAspxZipitSettings(cfusername, cfUsername_node_attributeValue);
            updateAspxZipitSettings(cfpasswd, cfPasswd_node_attributeValue);
            updateAspxZipitSettings(cfsnet, cfSnet_node_attributeValue);
        }
        catch (Exception ex)
        {
            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + ex.ToString());
        }
    }
    protected void updateAspxZipitSettings(string name, string value)
    {
        try
        {
            string webConfigPath = HttpContext.Current.Server.MapPath("~/aspxzipit/web.config");
            string xpathToSetting = string.Format("//add[@key='{0}']", name);

            XmlDocument xDoc = new XmlDocument();
            //Load web.config
            xDoc.Load(HttpContext.Current.Server.MapPath("~/aspxzipit/web.config"));
            //Find appSettings node
            XmlNodeList settingNodes = xDoc.GetElementsByTagName("appSettings");
            //Select appSettings node
            XmlNode appSettingNode = settingNodes[0].SelectSingleNode(xpathToSetting);

            if (appSettingNode != null && appSettingNode.Attributes != null)
            {
                XmlAttribute idAttribute = appSettingNode.Attributes["value"];
                if (idAttribute != null)
                {
                    idAttribute.Value = value;
                    xDoc.Save(webConfigPath);
                }
            }
        }
        catch (Exception ex)
        {
            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + ex.ToString());
        }
    }
    protected void removeUpdater()
    {
        try
        {

            string path = Server.MapPath("~\\");

            string LogResults1 = "  All Files have been removed from" + installerpath_update_backup + "\r\n";
            string LogResults2 = "  ASPX Zipit Temporary Directory has been removed : " + installerpath_update_backup + "\r\n";
            string LogResults3 = "  ASPX Zipit Update utility has been removed : " + Path.Combine(path, autoupdate) + " has been removed.                                                     \r\n";

            DirectoryInfo dirInfo1 = new DirectoryInfo(installerpath_update_backup);

            foreach (FileInfo f in dirInfo1.GetFiles())
            {
                f.Delete();
            }

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults1);

            Directory.Delete(installerpath_update_backup);

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults2);

            FileInfo fi3 = new FileInfo(path + autoupdate);
            fi3.Delete();

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults3);
        }
        catch (Exception ex)
        {
            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + ex.ToString());
        }
    }
    protected void rebuildASPXZipitStructure()
    {
        //Create list of directory names to create
        List<string> createDirArray = new List<string>();
        createDirArray.Add(installerPath_aspxzipit);
        createDirArray.Add(installerPath_assets);
        createDirArray.Add(installerPath_css);
        createDirArray.Add(installerPath_css_images);
        createDirArray.Add(installerPath_images);
        createDirArray.Add(installerPath_js);
        createDirArray.Add(installerPath_progress);

        //Loop though createDirArray to create directories
        foreach (string directory in createDirArray)
        {
            Directory.CreateDirectory(directory);
        }
    }
    protected void rebuildApplication()
    {
        try
        {
            string path = Server.MapPath("~\\");
            string filename = "web.config";
            string renamed_filename = "web.config.aspxzipit_renamed";
            string backup_filename = "web.config.aspxzipit_bak";
            string LogResults1 = DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + "  Application has been rebuilt successfully.                            \r\n";

            if (File.Exists(path + backup_filename))
            {
                FileInfo fi = new FileInfo(path + backup_filename);

                fi.Delete();

                File.Copy(path + filename, path + backup_filename);
                File.Move(path + filename, path + renamed_filename);
                File.Move(path + renamed_filename, path + filename);
                File.Delete(path + backup_filename);
                EventLogReporting(LogResults1);
            }
            else
            {
                File.Copy(path + filename, path + backup_filename);
                File.Move(path + filename, path + renamed_filename);
                File.Move(path + renamed_filename, path + filename);
                File.Delete(path + backup_filename);
                EventLogReporting(LogResults1);
            }
        }
        catch (Exception ex)
        {
            EventLogReporting(ex.ToString());
        }
    }
    protected void EventLogReporting(object LogResults)
    {
        string path = Server.MapPath("~/");
        string LogResultsString = LogResults.ToString();

        if (Directory.Exists(path))
        {
            if (!File.Exists(path + "\\aspxzipit_eventlog.txt"))
            {
                File.AppendAllText(path + "\\aspxzipit_eventlog.txt", String.Format(LogResultsString, Environment.NewLine));
            }
            else if (File.Exists(path + "\\aspxzipit_eventlog.txt"))
            {
                File.AppendAllText(path + "\\aspxzipit_eventlog.txt", String.Format(LogResultsString, Environment.NewLine));
            }
        }
    }
    protected static void Empty(System.IO.DirectoryInfo directory, string dirName)
    {
        foreach (System.IO.FileInfo file in directory.GetFiles()) file.Delete();
        foreach (System.IO.DirectoryInfo subDirectory in directory.GetDirectories()) subDirectory.Delete(true);
    }
</script>
<head id="Head1" runat="server">
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />

    <style id="importcss" runat="server" type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font: 1em "Arial", sans-serif;
            background: #ccc;
            background: url(https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/assets/images/background.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            background-color: #7397a7;
        }

        #wrapper {
            width: 720px;
            margin: 40px auto 0;
            padding-bottom: 20px;
        }

            #wrapper h1 {
                color: #2E2E2E;
                margin-bottom: 10px;
                font-family: 'Source Sans Pro', sans-serif;
            }

            #wrapper a {
                font-size: 1.2em;
                color: #108DE3;
                text-decoration: none;
                text-align: center;
            }

        #tabContainer {
            width: 700px;
            padding: 15px;
            background-color: #2e2e2e;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        #tabscontent {
            -moz-border-radius-topleft: 0px;
            -moz-border-radius-topright: 5px;
            -moz-border-radius-bottomright: 5px;
            -moz-border-radius-bottomleft: 5px;
            border-top-left-radius: 0px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-bottom-left-radius: 5px;
            padding: 10px 10px 25px;
            background: #FFFFFF; /* old browsers */
            background: -moz-linear-gradient(top, #FFFFFF 0%, #FFFFFF 90%, #e4e9ed 100%); /* firefox */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FFFFFF), color-stop(90%,#FFFFFF), color-stop(100%,#e4e9ed)); /* webkit */
            margin: 0;
            color: #333;
        }
    </style>
    <title>ASPXZipIt - Updating... - .NET 3.5, 4.0</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
            <h1>ASPX Zipit</h1>
            <div id="tabContainer">
                <div id="tabscontent" style="text-align: center">
                    <asp:Label runat="server" ID="lblInfo" ForeColor="Red" Text="" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
