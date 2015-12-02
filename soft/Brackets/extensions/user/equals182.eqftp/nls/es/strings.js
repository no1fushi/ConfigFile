define({
    "ERR_LOADING" : "Carga Fallida :(",

    "SIDEPANEL_TITLE" : "eqFTP",
    "SIDEPANEL_OPENCONNMANGR" : "Abrir Administrador de Conexiones",
    "SIDEPANEL_FILETREE_NAME" : "Nombre",
    "SIDEPANEL_FILETREE_SIZE" : "Tamaño",
    "SIDEPANEL_FILETREE_TYPE" : "Tipo",
    "SIDEPANEL_FILETREE_MODIFIED" : "Modificado",
    "SIDEPANEL_CONDISCONNECT" : "(Des)conectar",
    "SIDEPANEL_REFRESH" : "Refrescar",
    "SIDEPANEL_RELOADSETTINGS" : "Recargar configuración y reingresar la contraseña",

    "ERR_DIAG_SERVNOEXIST_TITLE" : "El servidor no existe",
    "ERR_DIAG_SERVNOEXIST_CONTENT" : "Parece que el servidor no existe.<br>Revise el apartado de Servidor en la configuración de conexión.",
    "ERR_DIAG_SERVCANTREACH_TITLE" : "No se puede conectar al servidor",
    "ERR_DIAG_SERVCANTREACH_CONTENT" : "No puedo conectar al servidor.<br>Tal vez tu Firewall no me deja hacerlo.",
    "ERR_DIAG_AUTHORIZEERR_TITLE" : "Datos de autenticación incorrectos",
    "ERR_DIAG_AUTHORIZEERR_CONTENT" : "No puedo autenticar con los datos que me diste.<br>Por favor revísalos.",
    "ERR_DIAG_NOSERVERFOUND_TITLE" : "No se puede encontrar la conexión",
    "ERR_DIAG_NOSERVERFOUND_CONTENT" : "No hay ningún servidor conectado ni conexiones eqFTP asociadas al proyecto actual.<br>Conéctese a un servidor o especifique la carpeta del proyecto actual como directorio local para conexión en la configuración.",
    "ERR_DIAG_ECONNRESET_TITLE" : "Servidor esta rechazando conexiones",
    "ERR_DIAG_ECONNRESET_CONTENT" : "No me puedo conectar al servidor, el no me lo permite.<br>Prueba reiniciando Brackets.",
    "ERR_DIAG_ECONNABORTED_TITLE" : "You've been disconnected from server", //NEW
	"ERR_DIAG_ECONNABORTED_CONTENT" : "Connection aborted. Trying to reconnect.", //NEW
    "ERR_DIAG_UNIVERSAL_TITLE" : "Aquí hay un error",
    "ERR_DIAG_UNIVERSAL_CONTENT" : "Mira este error! Como pudo pasar esto?",

    "NOT_DIAG_CONNECTED" : "Connected to server.", //NEW
    "NOT_DIAG_DISCONNECTED" : "Disconnected from server.", //NEW

    "PASSWDWIND_TITLE" : "Por favor ingrese su contraseña",
    "PASSWDWIND_CONTENT" : "Su contraseña para eqFTP:",

    "SETTINGSWIND_TITLE" : "Administrador de conexiones eqFTP",
    "SETTINGSWIND_ERR_BLANKS" : "Oops! Parece que algo salio mal. Revisa los datos y prueba nuevamente.",
    "SETTINGSWIND_ERR_CANTWRITE" : "Algo salio completamente mal! No puedo escribir la configuración en el archivo!",
    "SETTINGSWIND_ERR_LOCALPATHREPEAT" : "El directorio que estas intentando ingresar esta siendo utilizado por otra conexión.",
    "SETTINGSWIND_NOTIF_DONE" : "Todo se guardo! :)",
    "SETTINGSWIND_SAVEDCONN" : "Conexiones FTP guardas",
    "SETTINGSWIND_DELETECONN_HOVER" : "Borrar esta conexión",
    "SETTINGSWIND_ADDCONN_HOVER" : "Agregar nueva conexión",
    "SETTINGSWIND_ADDCONN_STRING" : "Crear nueva conexión...",
    "SETTINGSWIND_DELETECONNCONF_1" : "Por favor confirme el borrado de la conexión ", // Those 2 strings are going like this: SETTINGSWIND_DELETECONNCONF_1 + VAL + SETTINGSWIND_DELETECONNCONF_2
    "SETTINGSWIND_DELETECONNCONF_2" : ".", // So if in your language there's no need in 2 strings, just leave one of them blank
    "SETTINGSWIND_OPENGLOBSET" : "Abrir configuración global de FTP...",
    "SETTINGSWIND_NOTHINGYETMSG" : "Seleccione la conexión a editar en el panel lateral o cree una nueva.",
    "SETTINGSWIND_GLOB_FOLDERFORPROJ" : "Carpeta para proyectos:",
    "SETTINGSWIND_GLOB_FOLDERFORPROJ_DIAGTITLE" : "Carpeta para proyectos con archivos descargados:",
    "SETTINGSWIND_GLOB_FOLDERFORSET" : "Carpeta para configuración:",
    "SETTINGSWIND_GLOB_FOLDERFORSET_DIAGTITLE" : "Carpeta para el archivo de configuración",
    "SETTINGSWIND_GLOB_DONTOPENPROJECTS" : "No abra los proyectos después de la descraga",
    "SETTINGSWIND_GLOB_STORESAFELY" : "Guarde las contraseñas de forma segura",
    "SETTINGSWIND_GLOB_CONNECTIONNAME_TITLE" : "Nombre de conexión:",
    "SETTINGSWIND_GLOB_CONNECTIONNAME_FIELD" : "Digite el nombre de la conexión",
    "SETTINGSWIND_GLOB_SERVER_TITLE" : "Servidor:",
    "SETTINGSWIND_GLOB_PROTOCOL_TITLE" : "Tipo de protocolo:",
    "SETTINGSWIND_GLOB_USERNAME_TITLE" : "Nombre de usuario:",
    "SETTINGSWIND_GLOB_USERNAME_FIELD" : "Usuario FTP",
    "SETTINGSWIND_GLOB_PASSWORD_TITLE" : "Contraseña:",
    "SETTINGSWIND_GLOB_PASSWORD_FIELD" : "Contraseña FTP",
    "SETTINGSWIND_GLOB_REMOTEPATH_TITLE" : "Directorio remoto:",
    "SETTINGSWIND_GLOB_REMOTEPATH_FIELD" : "Digite el directorio remoto de la carpeta raíz del proyecto",
    "SETTINGSWIND_GLOB_LOCALPATH_TITLE" : "Directorio local:",
    "SETTINGSWIND_GLOB_LOCALPATH_FIELD" : "Si no se define crea una nueva carpeta en el directorio por defecto",
    "SETTINGSWIND_GLOB_UPLOADONSAVE" : "Subir archivo al guardar",
    "SETTINGSWIND_GLOB_EVENDISCONN" : "Aun si esta desconectado",
    "SETTINGSWIND_GLOB_EVENDISCONN_EXPLAIN" : "Esta opción automáticamente se conecta al servidor cuando un archivo guardado es abierto del servidor o el archivo y el proyecto fueron creados por esta extensión.",
    "SETTINGSWIND_GLOB_LOCALPATH_FILLWPROJECT_TITLE" : "Inserte la ubicación del proyecto actual",
    "SETTINGSWIND_GLOB_USELIST" : "Recuperación de carpeta alternativa",
    "SETTINGSWIND_GLOB_KEEPALIVE" : "Intervalo de comandos para mantener activo", // Keep Alive is feature when client sends empty packages to server to prevet disconnection.
    "SETTINGSWIND_GLOB_KEEPALIVE_DESC" : "Valor en segundos. Valor recomendado 10. Use cero para prohibir  los comandos para mantener activo y desconectar del servidor  cada vez que el comando es ejecutado.",
    "SETTINGSWIND_GLOB_DEBUG" : "Depurar:",
    "SETTINGSWIND_GLOB_TIMEFORMAT" : "Formato de fecha:",
    "SETTINGSWIND_GLOB_TIMEFORMAT_US" : "US",
    "SETTINGSWIND_GLOB_TIMEFORMAT_EU" : "Europeo",
	"SETTINGSWIND_GLOB_TIMEFORMAT_ASIAN" : "Asian", //NEW
    "SETTINGSWIND_GLOB_SYNC" : "Sincronizar",
    "SETTINGSWIND_GLOB_SYNC_DESC" : "Borrara o renombrara el archivo en el servidor remoto después de que fue cambiando en Brackets.",
	"SETTINGSWIND_GLOB_AUTOCLEAR" : "Auto-clear Queue", //NEW
    "SETTINGSWIND_GLOB_NOTIFICATIONS" : "Notifications", //NEW
    "SETTINGSWIND_GLOB_TIMEOFFSET" : "Time Offset:", //NEW
    "SETTINGSWIND_GLOB_TIMEOFFSET_DESC" : "Use this option to set correct time for Modified column", //NEW

    "QUEUE_TITLE" : "Cola de eqFTP",
    "QUEUE_TITLE_HOVER" : "Click para abrir la cola de eqFTP",
    "QUEUE_HEADER_NAME" : "Nombre",
    "QUEUE_HEADER_PATH" : "Directorio",
    "QUEUE_HEADER_FROM" : "Directorio de fuente",
    "QUEUE_HEADER_TO" : "Directorio destino",
    "QUEUE_HEADER_STATUS" : "Estado",
    "QUEUE_REMOVE" : "Remover de la cola",
    "QUEUE_CONTEXTM_STARTQ" : "Iniciar tarea",
    "QUEUE_CONTEXTM_PAUSEQ" : "Pausar Tarea",
    "QUEUE_CONTEXTM_CLEARQ" : "Limpiar cola",
    "QUEUE_CONTEXTM_CLEARCOMPQ" : "Limpiar tareas completadas",
    "QUEUE_CONTEXTM_CLEARFAILQ" : "Limpiar tareas fallidas",
	"QUEUE_CONTEXTM_CLEARPAUSQ" : "Clear Paused Tasks", //NEW
    "QUEUE_CONTEXTM_RESTARTFAILQ" : "Reiniciar tareas fallidas",
	"QUEUE_DONT_ADD_COMPLETED" : "Auto-clear Completed tasks", //NEW
    "ERR_FILE_ACCESSDENIED" : "Acceso denegado. Revise los permisos del archivo.",
    "ERR_FILE_AUTHORIZATION" : "Error de autenticación. Revise su usuario y contraseña.",
    "ERR_FILE_SERVNOEXIST" : "El servidor no existe. Tal vez tu lo escribiste mal.",
    "ERR_FILE_SERVCANTREACH" : "No se puede conectar al servidor. Revise el Firewall.",
	"ERR_FILE_FILESIZE0" : "Can't download file. Filesize is 0.", //NEW
    "ERR_FILE_DOWNLOAD" : "Can't download file.", //NEW
    "ERR_FILE_DOESNTEXIST" : "File doesn't exist", //NEW
    "ERR_FOLDER_OPEN" : "There's an error opening folder as project", //NEW

    "CONTEXTM_DOWNLOAD" : "Descargar",
    "CONTEXTM_UPLOAD" : "Subir",
    "CONTEXTM_ADDQUEUE" : "Añadir a la cola",
    "CONTEXTM_OPEN" : "Abrir",
    "CONTEXTM_DELETE" : "Borrar",
    "CONTEXTM_RENAME" : "Renombrar",
	"CONTEXTM_REDOWNLOAD" : "Download from server", //NEW

    "OTHER_SELECT_SERVER_DROPDOWN" : "Seleccione el servidor remoto a conectar...",
    "OTHER_ERROR" : "Error",
    "OTHER_PAUSED" : "Pausado",
    "OTHER_COMPLETED" : "Completado",
    "OTHER_CANCELLED" : "Cancelado",
    "OTHER_WAITING" : "Esperando",
    "OTHER_OK" : "Aceptar",
    "OTHER_CANCEL" : "Cancelar",
    "OTHER_APPLY" : "Aplicar",
    "OTHER_CLOSE" : "Cerrar",
    "OTHER_DELETE" : "Borrar",
	"OTHER_CONFIRM_DELETE" : "Are you sure you want to delete this item?", //NEW
	"OTHER_ERROR_EVENDISCONN" : "Can't upload file. 'Even If Disconnected' option is off.", //NEW
});