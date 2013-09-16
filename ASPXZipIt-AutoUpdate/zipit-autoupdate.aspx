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

    string backupusersxml = "\\users.xml";
    string backupaspxzipitwebconfig = "\\Web.config";
    string autoupdate = "\\zipit-autoupdate.aspx";

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

        string LogResults1 = "  ASPXZipIt Root Web.Config and Users.xml backed up successfully.                                                     \r\n";
        string LogResults2 = "  AspxZipIt update has begun.                                                     \r\n";
        string LogResults3 = "  AspxZipIt has been successfully update to:" + path + "           \r\n";
        string LogResults4 = "  Application has been successfully rebuilt.                                       \r\n";

        if (DotNetVersion == "35")
        {
            try
            {
                Directory.CreateDirectory(installerpath_update_backup);
                File.Copy(installerpath_App_Data + backupusersxml, installerpath_update_backup + backupusersxml);
                File.Copy(installerpath_aspxzipit + backupaspxzipitwebconfig, installerpath_update_backup + backupaspxzipitwebconfig);

                FileInfo fi1 = new FileInfo(installerpath_App_Data + backupusersxml);
                fi1.Delete();
                FileInfo fi2 = new FileInfo(installerpath_aspxzipit + backupaspxzipitwebconfig);
                fi2.Delete();
                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults1);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults2);

                downloadAspxZipIt(gitHubDotNetVersion35);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults3);

                rebuildApplication();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults4);

                removeUpdater();

                Response.Redirect("/aspxzipit/zipit-logs.aspx");
            }
            catch (Exception ex)
            {
                lblInfo.Text = "The process failed:" + ex.ToString();
            }
        }
        else if (DotNetVersion == "40")
        {
            try
            {
                Directory.CreateDirectory(installerpath_update_backup);
                File.Copy(installerpath_App_Data + backupusersxml, installerpath_update_backup + backupusersxml);
                File.Copy(installerpath_aspxzipit + backupaspxzipitwebconfig, installerpath_update_backup + backupaspxzipitwebconfig);

                FileInfo fi1 = new FileInfo(installerpath_App_Data + backupusersxml);
                fi1.Delete();
                FileInfo fi2 = new FileInfo(installerpath_aspxzipit + backupaspxzipitwebconfig);
                fi2.Delete();
                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults1);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults2);

                downloadAspxZipIt(gitHubDotNetVersion40);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults3);

                rebuildApplication();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults4);

                removeUpdater();

                Response.Redirect("/aspxzipit/zipit-logs.aspx");
            }
            catch (Exception ex)
            {
                lblInfo.Text = "The process failed:" + ex.ToString();
            }
        }
        else if (DotNetVersion == "45")
        {
            try
            {
                Directory.CreateDirectory(installerpath_update_backup);
                File.Copy(installerpath_App_Data + backupusersxml, installerpath_update_backup + backupusersxml);
                File.Copy(installerpath_aspxzipit + backupaspxzipitwebconfig, installerpath_update_backup + backupaspxzipitwebconfig);

                FileInfo fi1 = new FileInfo(installerpath_App_Data + backupusersxml);
                fi1.Delete();
                FileInfo fi2 = new FileInfo(installerpath_aspxzipit + backupaspxzipitwebconfig);
                fi2.Delete();
                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults1);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults2);

                downloadAspxZipIt(gitHubDotNetVersion45);

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults3);

                rebuildApplication();

                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults4);

                removeUpdater();

                Response.Redirect("/aspxzipit/zipit-logs.aspx");
            }
            catch (Exception ex)
            {
                lblInfo.Text = "The process failed:" + ex.ToString();
            }
        }
        else
        {
            lblInfo.Text = "In order for Auto Update to function you must tell it what version of .NET you are using.";
        }
    }
    //Download ASPXZipIt from GitHub
    protected void downloadAspxZipIt(string dotNetVersion)
    {
        string path = Server.MapPath("~\\");
        string fileName1 = "\\users.xml";
        string fileName2 = "\\Ionic.Zip.dll";
        string fileName3 = "\\ASPXZipIt-NET35.dll";
        string fileName4 = "\\ASPXZipIt-NET40.dll";
        string fileName5 = "\\ASPXZipIt-NET45.dll";
        string fileName6 = "\\OpenStack.Swift.dll";
        string fileName7 = "\\Rackspace.Cloudfiles.dll";
        string fileName19 = "\\Newtonsoft.Json.dll";
        string fileName20 = "\\openstacknet.dll";
        string fileName21 = "\\SimpleRESTServices.dll";
        string fileName8 = "\\Default.aspx";
        string fileName9 = "\\zipit-db.aspx";
        string fileName10 = "\\zipit-logs.aspx";
        string fileName11 = "\\zipit-login.aspx";
        string fileName12 = "\\zipit-settings.aspx";
        string fileName13 = "\\zipit-success.aspx";
        string fileName14 = "\\Web.config";
        string fileName15 = "\\DBResultPage.aspx";
        string fileName16 = "\\ResultPage.aspx";
        string fileName17 = "\\progress.gif";
        string fileName18 = "\\StyleSheet.css";

        string installerPath_AppData = path + "App_Data";
        string installerPath_bin = path + "bin";
        string installerPath_aspxzipit = path + "aspxzipit";
        string installerpath_update_backup = path + "aspxzipit_backup";
        string installerPath_progress = path + "aspxzipit" + "\\Progress";
        string installerPath_images = path + "aspxzipit" + "\\Images";
        string installerPath_styles = path + "aspxzipit" + "\\styles";
        string installerPath_sqlbak = path + "aspxzipit_sql_bak";

        string LogResults1 = "  The following file has been removed : ";
        string LogResults2 = "  AspxZipIt download has begun.                                                     \r\n";
        string LogResults3 = "  AspxZipIt has been successfully downloaded to:" + installerPath_aspxzipit + "           \r\n";
        string LogResults4 = "  ASPXZipIt crendentials have been successfully copied." + installerPath_AppData + backupusersxml + "                                           \r\n";
        string LogResults5 = "  CloudFiles API Information has been copied to" + installerPath_aspxzipit + "\r\n";
        string LogResults6 = "  All Files have been removed from" + installerpath_update_backup + "\r\n";
        string LogResults7 = "  " + installerpath_update_backup + " has been removed." + "\r\n";


        List<string> dirList = new List<string>();
        dirList.Add(installerPath_aspxzipit);
        dirList.Add(installerPath_progress);
        dirList.Add(installerPath_images);
        dirList.Add(installerPath_styles);

        List<string> src = new List<string>();
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/App_Data/users.xml");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/Default.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-db.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-logs.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-login.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-settings.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/zipit-success.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/Web.config");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/Progress/DBResultPage.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/Progress/ResultPage.aspx");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/images/progress.gif");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/styles/StyleSheet.css");

        List<string> dst = new List<string>();
        dst.Add(@installerPath_AppData + fileName1);
        dst.Add(@installerPath_aspxzipit + fileName8);
        dst.Add(@installerPath_aspxzipit + fileName9);
        dst.Add(@installerPath_aspxzipit + fileName10);
        dst.Add(@installerPath_aspxzipit + fileName11);
        dst.Add(@installerPath_aspxzipit + fileName12);
        dst.Add(@installerPath_aspxzipit + fileName13);
        dst.Add(@installerPath_aspxzipit + fileName14);
        dst.Add(@installerPath_progress + fileName15);
        dst.Add(@installerPath_progress + fileName16);
        dst.Add(@installerPath_images + fileName17);
        dst.Add(@installerPath_styles + fileName18);

        try
        {
            //Remove previous install
            foreach (string file in dst)
            {
                File.Delete(file);
                EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults1 + file + "\r\n");
            }

            if (dotNetVersion == "ASPXZipIt-NET35")
            {
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/Ionic.Zip.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/ASPXZipIt-NET35.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/OpenStack.Swift.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/Rackspace.Cloudfiles.dll");

                dst.Add(@installerPath_bin + fileName2);
                dst.Add(@installerPath_bin + fileName3);
                dst.Add(@installerPath_bin + fileName6);
                dst.Add(@installerPath_bin + fileName7);

            }
            else if (dotNetVersion == "ASPXZipIt-NET40")
            {
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/Ionic.Zip.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/ASPXZipIt-NET40.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/Newtonsoft.Json.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/openstacknet.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/SimpleRESTServices.dll");

                dst.Add(@installerPath_bin + fileName2);
                dst.Add(@installerPath_bin + fileName4);
                dst.Add(@installerPath_bin + fileName19);
                dst.Add(@installerPath_bin + fileName20);
                dst.Add(@installerPath_bin + fileName21);
            }
            else if (dotNetVersion == "ASPXZipIt-NET45")
            {
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/ASPXZipIt-NET45.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/Newtonsoft.Json.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/openstacknet.dll");
                src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/bin/SimpleRESTServices.dll");


                dst.Add(@installerPath_bin + fileName5);
                dst.Add(@installerPath_bin + fileName19);
                dst.Add(@installerPath_bin + fileName20);
                dst.Add(@installerPath_bin + fileName21);
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

            File.Copy(installerpath_update_backup + backupusersxml, installerPath_AppData + backupusersxml, true);

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults4);

            File.Copy(installerpath_update_backup + backupaspxzipitwebconfig, installerPath_aspxzipit + backupaspxzipitwebconfig, true);

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults5);

            DirectoryInfo dirInfo1 = new DirectoryInfo(installerpath_update_backup);

            foreach (FileInfo f in dirInfo1.GetFiles())
            {
                f.Delete();
            }

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults6);

            Directory.Delete(installerpath_update_backup);

            EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults7);
        }
        catch (Exception ex)
        {
            lblInfo.Text = "The process failed:" + ex.ToString();
        }
    }
    protected void removeUpdater()
    {
        string path = Server.MapPath("~\\");
        string LogResults = "  ASPXZipIt update is complete." + "                                                     \r\n";

        FileInfo fi3 = new FileInfo(path + autoupdate);
        fi3.Delete();

        EventLogReporting(DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss") + LogResults);
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
</script>
<head id="Head1" runat="server">
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />

    <style id="importcss" runat="server" type="text/css">
        body {
            height: 100%;
            background: #ddd;
            margin-bottom: 1px;
        }

        .clear {
            clear: both;
        }

        input {
            border: 1px solid #818185;
            -moz-border-radius: 15px;
            border-radius: 15px;
            height: 30px;
            width: 200px;
            padding-left: 8px;
            padding-right: 8px;
        }

        .button {
            border: 1px solid #818185;
            background-color: #ccc;
            -moz-border-radius: 15px;
            border-radius: 15px;
            text-align: center;
            width: 100px;
            color: #000;
            padding: 3px;
        }

        .wrapper {
            width: 700px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -225px 0 0 -345px;
            background-color: #eee;
            -moz-border-radius: 15px;
            border-radius: 15px;
            text-align: center;
            padding: 20px;
            -moz-box-shadow: 5px 5px 7px #888;
            -webkit-box-shadow: 5px 5px 7px #888;
        }

        a {
            color: #55688A;
        }



        * {
            margin: 0;
            padding: 0;
        }

        .group {
            zoom: 1;
            position: absolute;
            top: -47px;
            left: 24px;
        }

        .head {
            text-align: center;
            font-family: Fontin, sans-serif;
            font-size: 28px;
            margin-bottom: 10px;
        }


        .tabs {
            list-style: none;
            width: 700px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -262px 0 0 -325px;
        }

            .tabs li {
                /* Makes a horizontal row */
                float: left; /* So the psueudo elements can be 			   abs. positioned inside */
                position: relative;
            }

            .tabs a {
                /* Make them block level 		     and only as wide as they need */
                float: left;
                padding: 10px 40px;
                text-decoration: none; /* Default colors */
                color: black;
                background: #CCCCCC; /* Only round the top corners */
                -webkit-border-top-left-radius: 15px;
                -webkit-border-top-right-radius: 15px;
                -moz-border-radius-topleft: 15px;
                -moz-border-radius-topright: 15px;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
            }

            .tabs .active {
                /* Highest, active tab is on top */
                z-index: 3;
            }

                .tabs .active a {
                    /* Colors when tab is active */
                    background: #eee;
                    color: black;
                }
    </style>
    <title>ASPXZipIt - Installer - .NET 3.5, 4.0</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <asp:Label runat="server" ID="lblInfo" ForeColor="Red" Text="" />
        </div>
    </form>
</body>
</html>
