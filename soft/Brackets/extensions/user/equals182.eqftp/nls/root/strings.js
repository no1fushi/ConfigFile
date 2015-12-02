define({
	"ERR_LOADING" : "Loading failed :(",

	"SIDEPANEL_TITLE" : "eqFTP",
	"SIDEPANEL_OPENCONNMANGR" : "Open Connection Manager",
	"SIDEPANEL_FILETREE_NAME" : "Name",
	"SIDEPANEL_FILETREE_SIZE" : "Size",
	"SIDEPANEL_FILETREE_TYPE" : "Type",
	"SIDEPANEL_FILETREE_MODIFIED" : "Modified",
	"SIDEPANEL_CONDISCONNECT" : "(Dis)connect",
	"SIDEPANEL_REFRESH" : "Refresh",
	"SIDEPANEL_RELOADSETTINGS" : "Reload Settings & Re-enter Password",

	"ERR_DIAG_SERVNOEXIST_TITLE" : "Server Doesn't Exist",
	"ERR_DIAG_SERVNOEXIST_CONTENT" : "Looks like this server doesn't exist.<br>Check Server filed in connection settings.",
	"ERR_DIAG_SERVCANTREACH_TITLE" : "Can't Reach Server",
	"ERR_DIAG_SERVCANTREACH_CONTENT" : "I just can't reach server.<br>Maybe your Firewall don't let me do this.",
	"ERR_DIAG_AUTHORIZEERR_TITLE" : "Incorrect Authorization Data",
	"ERR_DIAG_AUTHORIZEERR_CONTENT" : "I can't authorize with those login and password you gave me.<br>Please check them.",
	"ERR_DIAG_NOSERVERFOUND_TITLE" : "Can't find connection",
	"ERR_DIAG_NOSERVERFOUND_CONTENT" : "There are no eqFTP connections tied with current project and no connected server.<br>Connect to server or specify current project's folder as local path for connection in Settings.",
	"ERR_DIAG_ECONNRESET_TITLE" : "Server denying connections",
	"ERR_DIAG_ECONNRESET_CONTENT" : "I can't connect to server, it doesn't allows me.<br>Try restart Brackets.",
    "ERR_DIAG_ECONNABORTED_TITLE" : "You've been disconnected from server", //NEW
	"ERR_DIAG_ECONNABORTED_CONTENT" : "Connection aborted. Trying to reconnect...", //NEW
	"ERR_DIAG_UNIVERSAL_TITLE" : "There's an error",
	"ERR_DIAG_UNIVERSAL_CONTENT" : "Look at this error! How could it happen?",
    
    "NOT_DIAG_CONNECTED" : "Connected to server.", //NEW
    "NOT_DIAG_DISCONNECTED" : "Disconnected from server.", //NEW

	"PASSWDWIND_TITLE" : "Please Enter Your Password",
	"PASSWDWIND_CONTENT" : "Your Password for eqFTP:",

	"SETTINGSWIND_TITLE" : "eqFTP Connections Manager",
	"SETTINGSWIND_ERR_BLANKS" : "Oops! Looks like something is wrong. Check input fields and try again.",
	"SETTINGSWIND_ERR_CANTWRITE" : "Something went totally wrong! I can't write settings to file!",
	"SETTINGSWIND_ERR_LOCALPATHREPEAT" : "The path you're trying to insert is currently in use by another connection.",
	"SETTINGSWIND_NOTIF_DONE" : "Everything's saved! :)",
	"SETTINGSWIND_SAVEDCONN" : "Saved FTP Connections",
	"SETTINGSWIND_DELETECONN_HOVER" : "Delete This Connection",
	"SETTINGSWIND_ADDCONN_HOVER" : "Add New Connection",
	"SETTINGSWIND_ADDCONN_STRING" : "Create New Connection...",
	"SETTINGSWIND_DELETECONNCONF_1" : "Please confirm deletion of ", // Those 2 strings are going like this: SETTINGSWIND_DELETECONNCONF_1 + VAL + SETTINGSWIND_DELETECONNCONF_2
	"SETTINGSWIND_DELETECONNCONF_2" : " connection.", // So if in your language there's no need in 2 strings, just leave one of them blank
	"SETTINGSWIND_OPENGLOBSET" : "Open Global FTP Settings...",
	"SETTINGSWIND_NOTHINGYETMSG" : "Choose connection to edit in sidebar or create new.",
	"SETTINGSWIND_GLOB_FOLDERFORPROJ" : "Folder For Projects:",
	"SETTINGSWIND_GLOB_FOLDERFORPROJ_DIAGTITLE" : "Directory for Projects with Downloaded Files:",
	"SETTINGSWIND_GLOB_FOLDERFORSET" : "Folder For Settings:",
	"SETTINGSWIND_GLOB_FOLDERFORSET_DIAGTITLE" : "Directory for Settings File",
	"SETTINGSWIND_GLOB_DONTOPENPROJECTS" : "Don't Open Projects after Download",
	"SETTINGSWIND_GLOB_STORESAFELY" : "Store Passwords Safely",
	"SETTINGSWIND_GLOB_CONNECTIONNAME_TITLE" : "Connection Name:",
	"SETTINGSWIND_GLOB_CONNECTIONNAME_FIELD" : "Type in name of connection",
	"SETTINGSWIND_GLOB_SERVER_TITLE" : "Server:",
	"SETTINGSWIND_GLOB_PROTOCOL_TITLE" : "Protocol Type:",
	"SETTINGSWIND_GLOB_USERNAME_TITLE" : "Username:",
	"SETTINGSWIND_GLOB_USERNAME_FIELD" : "FTP username",
	"SETTINGSWIND_GLOB_PASSWORD_TITLE" : "Password:",
	"SETTINGSWIND_GLOB_PASSWORD_FIELD" : "FTP password",
	"SETTINGSWIND_GLOB_REMOTEPATH_TITLE" : "Remote Path:",
	"SETTINGSWIND_GLOB_REMOTEPATH_FIELD" : "Type in the remote path to the project root folder",
	"SETTINGSWIND_GLOB_LOCALPATH_TITLE" : "Local Path:",
	"SETTINGSWIND_GLOB_LOCALPATH_FIELD" : "Creates new folder in default location if blank",
	"SETTINGSWIND_GLOB_UPLOADONSAVE" : "Upload File on Save",
	"SETTINGSWIND_GLOB_EVENDISCONN" : "Even If Disconnected",
	"SETTINGSWIND_GLOB_EVENDISCONN_EXPLAIN" : "This option automatically connects to a server when a saved file is opened from the server or a saved file is within the current project and this project was created by this ftp extension. Oh, I really hope I explained it well...",
	"SETTINGSWIND_GLOB_LOCALPATH_FILLWPROJECT_TITLE" : "Insert current project's path",
	"SETTINGSWIND_GLOB_USELIST" : "Alternative folder retrieving",
	"SETTINGSWIND_GLOB_KEEPALIVE" : "Keep alive interval", // Keep Alive is feature when client sends empty packages to server to prevet disconnection.
	"SETTINGSWIND_GLOB_KEEPALIVE_DESC" : "Value in seconds. Recommended value is 10. Use zero to forbid keep alive commands and disconnect from server every time command is done.",
	"SETTINGSWIND_GLOB_DEBUG" : "Debug:",
	"SETTINGSWIND_GLOB_TIMEFORMAT" : "Date Format:",
	"SETTINGSWIND_GLOB_TIMEFORMAT_US" : "US",
	"SETTINGSWIND_GLOB_TIMEFORMAT_EU" : "European",
	"SETTINGSWIND_GLOB_TIMEFORMAT_ASIAN" : "Asian", //NEW
	"SETTINGSWIND_GLOB_SYNC" : "Synchronize",
	"SETTINGSWIND_GLOB_SYNC_DESC" : "Will delete or rename file on remote server after it was changed in Brackets.",
	"SETTINGSWIND_GLOB_AUTOCLEAR" : "Auto-clear Queue", //NEW
    "SETTINGSWIND_GLOB_NOTIFICATIONS" : "Notifications", //NEW
    "SETTINGSWIND_GLOB_TIMEOFFSET" : "Time Offset:", //NEW
    "SETTINGSWIND_GLOB_TIMEOFFSET_DESC" : "Use this option to set correct time for Modified column", //NEW

	"QUEUE_TITLE" : "eqFTP Queue",
	"QUEUE_TITLE_HOVER" : "Click to Open eqFTP Queue",
	"QUEUE_HEADER_NAME" : "Name",
	"QUEUE_HEADER_PATH" : "Path",
	"QUEUE_HEADER_FROM" : "Source Path",
	"QUEUE_HEADER_TO" : "Destination Path",
	"QUEUE_HEADER_STATUS" : "Status",
	"QUEUE_REMOVE" : "Remove from Queue",
	"QUEUE_CONTEXTM_STARTQ" : "Start Task",
	"QUEUE_CONTEXTM_PAUSEQ" : "Pause Task",
	"QUEUE_CONTEXTM_CLEARQ" : "Clear Queue",
	"QUEUE_CONTEXTM_CLEARCOMPQ" : "Clear Completed Tasks",
	"QUEUE_CONTEXTM_CLEARFAILQ" : "Clear Failed Tasks",
	"QUEUE_CONTEXTM_CLEARPAUSQ" : "Clear Paused Tasks", //NEW
	"QUEUE_CONTEXTM_RESTARTFAILQ" : "Restart Failed Tasks",
	"QUEUE_DONT_ADD_COMPLETED" : "Auto-clear Completed tasks", //NEW
	"ERR_FILE_ACCESSDENIED" : "Access denied. Check file's permissions.",
	"ERR_FILE_AUTHORIZATION" : "Authorization Error. Check your login & password.",
	"ERR_FILE_SERVNOEXIST" : "Server Doesn't Exist. Maybe you mistyped it.",
	"ERR_FILE_SERVCANTREACH" : "Can't Reach Server. Check Firewall.",
	"ERR_FILE_FILESIZE0" : "Can't download file. Filesize is 0.", //NEW
    "ERR_FILE_DOWNLOAD" : "Can't download file.", //NEW
    "ERR_FILE_DOESNTEXIST" : "File doesn't exist", //NEW
    "ERR_FOLDER_OPEN" : "There's an error opening folder as project", //NEW

	"CONTEXTM_DOWNLOAD" : "Download",
	"CONTEXTM_UPLOAD" : "Upload",
	"CONTEXTM_ADDQUEUE" : "Add to Queue",
	"CONTEXTM_OPEN" : "Open",
	"CONTEXTM_DELETE" : "Delete",
	"CONTEXTM_RENAME" : "Rename",
	"CONTEXTM_REDOWNLOAD" : "Download from server", //NEW

	"OTHER_SELECT_SERVER_DROPDOWN" : "Select Remote Server to Connect...",
	"OTHER_ERROR" : "Error",
	"OTHER_PAUSED" : "Paused",
	"OTHER_COMPLETED" : "Completed",
	"OTHER_CANCELLED" : "Cancelled",
	"OTHER_WAITING" : "Waiting",
	"OTHER_OK" : "Ok",
	"OTHER_CANCEL" : "Cancel",
	"OTHER_APPLY" : "Apply",
	"OTHER_CLOSE" : "Close",
	"OTHER_DELETE" : "Delete",
	"OTHER_CONFIRM_DELETE" : "Are you sure you want to delete this item?", //NEW
	"OTHER_ERROR_EVENDISCONN" : "Can't upload file. 'Even If Disconnected' option is off.", //NEW
});