<%@ Page Language="C#" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Xml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script runat="server">

    //ASPXZipIt Designed and Mainted By: Matthew Costello, 1/28/2013, San Antonio, Texas.

    string timestamp = DateTime.Now.ToString("MM-dd-yyyy_HH-mm-ss");

    protected void Page_Load(object sender, EventArgs e)
    {
        string DotNetVersion = Request.QueryString["DotNetVersion"];

        string path = Server.MapPath("~/");
        string filename1 = "/users.xml";
        string filename2 = "/Ionic.Zip.dll";
        string filename3 = "/ASPXZipIt-NET35.dll";
        string filename4 = "/ASPXZipIt-NET40.dll";
        string filename5 = "/ASPXZipIt-NET45.dll";
        string filename6 = "/OpenStack.Swift.dll";
        string filename7 = "/Rackspace.Cloudfiles.dll";
        string filename8 = "/Default.aspx";
        string filename9 = "/zipit-db.aspx";
        string filename10 = "/zipit-logs.aspx";
        string filename11 = "/zipit-login.aspx";
        string filename12 = "/zipit-settings.aspx";
        string filename13 = "/zipit-success.aspx";
        string filename14 = "/Web.config";
        string filename15 = "/DBResultPage.aspx";
        string filename16 = "/ResultPage.aspx";
        string filename17 = "/progress.gif";
        string filename18 = "/StyleSheet.css";

        string backupusersxml = "\\users.xml";
        string backupaspxzipitwebconfig = "\\Web.config";
        string autoupdate = "/zipit-autoupdate.aspx";


        string installerpath_App_Data = path + "\\App_Data";
        string installerpath_update_backup = path + "/aspxzipit_backup";
        string installerpath_bin = path + "/bin";
        string installerpath_aspxzipit = path + "/aspxzipit";
        string installerpath_progress = path + "/aspxzipit" + "/Progress";
        string installerpath_images = path + "/aspxzipit" + "/Images";
        string installerpath_styles = path + "/aspxzipit" + "/styles";
        string installerpath_sqlbak = path + "/aspxzipit_sql_bak";
        string LogResults1 = timestamp + "  ASPXZipIt Root Web.Config and Users.xml backed up successfully.                                                     \r\n";
        string LogResults2 = timestamp + "  AspxZipIt update has begun.                                                     \r\n";
        string LogResults3 = timestamp + "  AspxZipIt has been successfully update to:" + path + "           \r\n";
        string LogResults4 = timestamp + "  Application has been successfully rebuilt.                                       \r\n";
        string LogResults5 = timestamp + "  ASPXZipIt crendentials have been successfully copied." + installerpath_App_Data + backupusersxml + "                                           \r\n";
        string LogResults6 = timestamp + "  CloudFiles API Information has been copied to" + installerpath_aspxzipit + filename13 + "\r\n";

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
                EventLogReporting(LogResults1);

                EventLogReporting(LogResults2);

                WebClient webClient = new WebClient();
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/App_Data/users.xml", @installerpath_App_Data + filename1);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/bin/Ionic.Zip.dll", @installerpath_bin + filename2);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/bin/ASPXZipIt-NET35.dll", @installerpath_bin + filename3);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/bin/OpenStack.Swift.dll", @installerpath_bin + filename6);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/bin/Rackspace.Cloudfiles.dll", @installerpath_bin + filename7);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/Default.aspx", @installerpath_aspxzipit + filename8);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/zipit-db.aspx", @installerpath_aspxzipit + filename9);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/zipit-logs.aspx", @installerpath_aspxzipit + filename10);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/zipit-login.aspx", @installerpath_aspxzipit + filename11);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/zipit-settings.aspx", @installerpath_aspxzipit + filename12);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/zipit-success.aspx", @installerpath_aspxzipit + filename13);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/Web.config", @installerpath_aspxzipit + filename14);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/Progress/DBResultPage.aspx", @installerpath_progress + filename15);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/Progress/ResultPage.aspx", @installerpath_progress + filename16);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/images/progress.gif", @installerpath_images + filename17);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET35/raw/master/aspxzipit/styles/StyleSheet.css", @installerpath_styles + filename18);

                EventLogReporting(LogResults3);

                rebuildapplication();

                EventLogReporting(LogResults4);

                File.Copy(installerpath_update_backup + backupusersxml, installerpath_App_Data + backupusersxml, true);

                EventLogReporting(LogResults5);

                File.Copy(installerpath_update_backup + backupaspxzipitwebconfig, installerpath_aspxzipit + backupaspxzipitwebconfig, true);

                EventLogReporting(LogResults6);

                DirectoryInfo dirInfo1 = new DirectoryInfo(installerpath_update_backup);

                foreach (FileInfo f in dirInfo1.GetFiles())
                {
                    f.Delete();
                }

                Directory.Delete(installerpath_update_backup);

                FileInfo fi3 = new FileInfo(path + autoupdate);
                fi3.Delete();
                
                Response.Redirect("/aspxzipit/zipit-logs.aspx", false);
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
                EventLogReporting(LogResults1);

                EventLogReporting(LogResults2);

                WebClient webClient = new WebClient();
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/App_Data/users.xml", @installerpath_App_Data + filename1);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/bin/Ionic.Zip.dll", @installerpath_bin + filename2);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/bin/ASPXZipIt-NET40.dll", @installerpath_bin + filename4);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/bin/OpenStack.Swift.dll", @installerpath_bin + filename6);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/bin/Rackspace.Cloudfiles.dll", @installerpath_bin + filename7);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/Default.aspx", @installerpath_aspxzipit + filename8);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/zipit-db.aspx", @installerpath_aspxzipit + filename9);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/zipit-logs.aspx", @installerpath_aspxzipit + filename10);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/zipit-login.aspx", @installerpath_aspxzipit + filename11);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/zipit-settings.aspx", @installerpath_aspxzipit + filename12);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/zipit-success.aspx", @installerpath_aspxzipit + filename13);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/Web.config", @installerpath_aspxzipit + filename14);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/Progress/DBResultPage.aspx", @installerpath_progress + filename15);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/Progress/ResultPage.aspx", @installerpath_progress + filename16);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/images/progress.gif", @installerpath_images + filename17);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET40/raw/master/aspxzipit/styles/StyleSheet.css", @installerpath_styles + filename18);

                EventLogReporting(LogResults3);

                rebuildapplication();

                EventLogReporting(LogResults4);

                File.Copy(installerpath_update_backup + backupusersxml, installerpath_App_Data + backupusersxml, true);

                EventLogReporting(LogResults5);

                File.Copy(installerpath_update_backup + backupaspxzipitwebconfig, installerpath_aspxzipit + backupaspxzipitwebconfig, true);

                EventLogReporting(LogResults6);

                DirectoryInfo dirInfo1 = new DirectoryInfo(installerpath_update_backup);

                foreach (FileInfo f in dirInfo1.GetFiles())
                {
                    f.Delete();
                }

                Directory.Delete(installerpath_update_backup);

                FileInfo fi3 = new FileInfo(path + autoupdate);
                fi3.Delete();

                Response.Redirect("/aspxzipit/zipit-logs.aspx", false);
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
                EventLogReporting(LogResults1);

                EventLogReporting(LogResults2);

                WebClient webClient = new WebClient();
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/App_Data/users.xml", @installerpath_App_Data + filename1);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/bin/ASPXZipIt-NET45.dll", @installerpath_bin + filename5);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/bin/OpenStack.Swift.dll", @installerpath_bin + filename6);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/bin/Rackspace.Cloudfiles.dll", @installerpath_bin + filename7);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/Default.aspx", @installerpath_aspxzipit + filename8);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/zipit-db.aspx", @installerpath_aspxzipit + filename9);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/zipit-logs.aspx", @installerpath_aspxzipit + filename10);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/zipit-login.aspx", @installerpath_aspxzipit + filename11);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/zipit-settings.aspx", @installerpath_aspxzipit + filename12);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/zipit-success.aspx", @installerpath_aspxzipit + filename13);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/Web.config", @installerpath_aspxzipit + filename14);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/Progress/DBResultPage.aspx", @installerpath_progress + filename15);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/Progress/ResultPage.aspx", @installerpath_progress + filename16);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/images/progress.gif", @installerpath_images + filename17);
                webClient.DownloadFile("https://github.com/onesandzeros415/ASPXZipIt-NET45/raw/master/aspxzipit/styles/StyleSheet.css", @installerpath_styles + filename18);

                EventLogReporting(LogResults3);

                rebuildapplication();

                EventLogReporting(LogResults4);

                File.Copy(installerpath_update_backup + backupusersxml, installerpath_App_Data + backupusersxml, true);

                EventLogReporting(LogResults5);

                File.Copy(installerpath_update_backup + backupaspxzipitwebconfig, installerpath_aspxzipit + backupaspxzipitwebconfig, true);

                EventLogReporting(LogResults6);

                DirectoryInfo dirInfo1 = new DirectoryInfo(installerpath_update_backup);

                foreach (FileInfo f in dirInfo1.GetFiles())
                {
                    f.Delete();
                }

                Directory.Delete(installerpath_update_backup);

                FileInfo fi3 = new FileInfo(path + autoupdate);
                fi3.Delete();

                Response.Redirect("/aspxzipit/zipit-logs.aspx", false);
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
    protected void rebuildapplication()
    {
        try
        {
            string path = Server.MapPath("~/");
            string filename = "web.config";
            string renamed_filename = "web.config.aspxzipit_renamed";
            string backup_filename = "web.config.aspxzipit_bak";
            string LogResults1 = timestamp + "  Application has been rebuilt successfully.                            \r\n";

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
