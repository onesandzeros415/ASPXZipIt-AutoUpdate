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

    protected static string path = HttpContext.Current.Server.MapPath("~\\");
    protected static string rootwebConfigPath = HttpContext.Current.Server.MapPath("~\\Web.config");

    protected static string aspxZipItInstaller = "\\ASPXZipIt-Installer.aspx";
    protected static string fileName1 = "\\users.xml";
    protected static string fileName2 = "\\Ionic.Zip.dll";
    protected static string fileName3 = "\\ASPXZipIt-NET35.dll";
    protected static string fileName4 = "\\ASPXZipIt-NET40.dll";
    protected static string fileName5 = "\\ASPXZipIt-NET45.dll";
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
    protected static string fileName17 = "\\progress.gif";
    protected static string fileName18 = "\\style.css";
    protected static string fileName22 = "\\background.jpg";
    protected static string fileName23 = "\\logout.png";
    protected static string fileName24 = "\\settings.png";
    protected static string fileName25 = "\\aspxzipit.js";

    protected static string installerPath_AppData = path + "App_Data";
    protected static string installerPath_bin = path + "bin";
    protected static string installerPath_aspxzipit = path + "aspxzipit";
    protected static string installerPath_progress = path + "aspxzipit" + "\\Progress";
    protected static string installerPath_assets = path + "aspxzipit" + "\\assets";
    protected static string installerPath_css = path + "aspxzipit" + "\\assets" + "\\css";
    protected static string installerPath_images = path + "aspxzipit" + "\\assets" + "\\images";
    protected static string installerPath_js = path + "aspxzipit" + "\\assets" + "\\js";
    protected static string installerPath_sqlbak = path + "aspxzipit_sql_bak";
    protected static string installerpath_update_backup = path + "aspxzipit_backup";

    //ASPXZipIt Designed and Mainted By: Matthew Costello, 1/28/2013, San Antonio, Texas.

    protected static string backupusersxml = "\\users.xml";
    protected static string backupaspxzipitwebconfig = "\\Web.config";
    protected static string autoupdate = "\\zipit-autoupdate.aspx";

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
        string LogResults1 = "  AspxZipIt has been successfully removed : ";
        string LogResults2 = "  AspxZipIt download has begun.                                                     \r\n";
        string LogResults3 = "  AspxZipIt has been successfully downloaded to:" + installerPath_aspxzipit + "           \r\n";
        string LogResults4 = "  ASPXZipIt crendentials have been successfully copied." + installerPath_AppData + backupusersxml + "                                           \r\n";
        string LogResults5 = "  CloudFiles API Information has been copied to" + installerPath_aspxzipit + "\r\n";
        string LogResults6 = "  All Files have been removed from" + installerpath_update_backup + "\r\n";
        string LogResults7 = "  " + installerpath_update_backup + " has been removed." + "\r\n";

        //Setup source github urls
        List<string> src = new List<string>();
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/App_Data/users.xml");
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
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/images/progress.gif");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/css/StyleSheet.css");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/images/background.jpg");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/images/logout.png");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/images/settings.gif");
        src.Add("https://github.com/onesandzeros415/" + dotNetVersion + "/raw/master/aspxzipit/assets/js/aspxzipit.js");

        //Setup destination install list
        List<string> dst = new List<string>();
        dst.Add(@installerPath_AppData + fileName1);
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
        dst.Add(@installerPath_images + fileName17);
        dst.Add(@installerPath_images + fileName22);
        dst.Add(@installerPath_images + fileName23);
        dst.Add(@installerPath_images + fileName24);
        dst.Add(@installerPath_css + fileName18);
        dst.Add(@installerPath_js + fileName25);

        try
        {
            //Remove previous ASPX Zipit install
            System.IO.DirectoryInfo directory = new System.IO.DirectoryInfo(@installerPath_aspxzipit);
            Empty(directory, installerPath_aspxzipit);
            Directory.Delete(installerPath_aspxzipit);

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
    protected static void Empty(System.IO.DirectoryInfo directory, string dirName)
    {
        foreach (System.IO.FileInfo file in directory.GetFiles()) file.Delete();
        foreach (System.IO.DirectoryInfo subDirectory in directory.GetDirectories()) subDirectory.Delete(true);
        Directory.Delete(dirName);
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
