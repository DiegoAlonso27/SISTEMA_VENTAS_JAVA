package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class database {
    // Declara las variables de configuración de la conexión
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String USERNAME = System.getenv("USER");
    private static final String PASSWORD = System.getenv("PASS");
    private static final String DATABASE = System.getenv("DATABASE");
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=" + DATABASE + ";user=" + USERNAME + ";password=" + PASSWORD;

    // Declara la variable que almacenará la conexión
    private static Connection conexion;

    // Establece la conexión con SQL Server
    public static void conectar() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        conexion = DriverManager.getConnection(URL);
    }

    // Cierra la conexión con SQL Server
    public static void desconectar() throws SQLException {
        conexion.close();
    }

    // Devuelve la conexión con SQL Server
    public static Connection getConexion() {
        return conexion;
    }

}
