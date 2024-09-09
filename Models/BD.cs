using System.Data.SqlClient;
using System;
using Dapper;
public class BD{
    private static string _connectionString = @"Server=localhost; DataBase=PreguntadoORT;Trusted_Connection=True;";
    public static List<Preguntas> ListaPreguntas = new List<Preguntas> ();
    public static List<Respuestas> ListaRespuestas = new List<Respuestas> ();
    public static void ObtenerCategorias(Categorias cate)
    {
        
        using(SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categorias";
            PreguntadoORT.Execute(sql, new{Nombre = cate.Nombre, Foto = cate.Foto}); 
            List<Categorias> listaCategorias = PreguntadoORT.Query<Categorias>(sql).ToList();
        }
     
    }
    public static void ObtenerDificultades(Dificultades difi)
    {
        using(SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Dificultades";
            PreguntadoORT.Execute(sql, new{Nombre = difi.Nombre}); 
            List<Dificultades> Listadificultades = PreguntadoORT.Query<Dificultades>(sql).ToList();
        }
    }
    
    public static List<Preguntas> ObtenerPreguntas(int idDificultad, int idCategoria){        
        
        
        using(SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        {
            if(idDificultad == -1 && idCategoria == -1)
            {
            string sql = "SELECT * FROM Preguntas";
            ListaPreguntas = PreguntadoORT.Query<Preguntas>(sql).ToList();
            }
            else if(idDificultad == -1){
            string sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pidCategoria ";
            ListaPreguntas = PreguntadoORT.Query<Preguntas>(sql, new{pIdCategoria = idCategoria}).ToList();
            }
            else if(idCategoria == -1){
            string sql = "SELECT * FROM Preguntas WHERE IdDificultad = @pidDificultad ";
            ListaPreguntas = PreguntadoORT.Query<Preguntas>(sql, new{pIdDificultad = idDificultad}).ToList();
            }
            else{
            string sql = "SELECT * FROM Preguntas WHERE  IdDificultad = @pidDificultad  AND  IdCategoria = @pidCategoria ";
            ListaPreguntas = PreguntadoORT.Query<Preguntas>(sql, new{pIdDificultad = idDificultad, pidCategoria = idCategoria}).ToList();
            }
            
        }
        return ListaPreguntas;
    }
    public static List<Respuestas> ObtenerRespuestas(List<Preguntas> ListaPreguntas){  
        using(SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        {
            foreach(Preguntas preg in ListaPreguntas){
                string sql = "SELECT * FROM Respuestas WHERE  IdPregunta = @pPregunta";
                List<Respuestas> resp = PreguntadoORT.Query<Respuestas>(sql, new{pPregunta = preg.IdPregunta} ).ToList();
                ListaRespuestas.AddRange (resp);
            }
        }
        return ListaRespuestas;
    }

    public static void AgregarPuntaje(DateTime fecha)
    {
        //string u;
        //u  = Juego.Username;
        //int punt = Juego.puntajeActual;
        //string sql = "INSERT INTO Puntajes(NombreJugador, Puntaje, FechaHora) VALUES (@u, @punt, @fecha)";
        //using(SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        //{
            //PreguntadoORT.Execute(sql, new{u = NombreJugador, punt = Puntaje, FechaHora = fecha}); 
        //}
        string nombreJugador = Juego.Username;
        int puntaje = Juego.puntajeActual;    

        string sql = "INSERT INTO Puntajes(NombreJugador, Puntaje, FechaHora) VALUES (@NombreJugador, @Puntaje, @FechaHora)";
        
        using (SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(sql, new { NombreJugador = nombreJugador, Puntaje = puntaje, FechaHora = fecha });
        }

    }
    public static List<Puntajes> ObtenerJugadores(){  
        
        /*List<Puntajes> ListaJugadores = new List<Puntajes> ();
        using(SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Puntajes ORDER BY Puntaje DESC";
            listaJugadores = connection.Query<Puntajes>(sql).ToList();
        }
        return listaJugadores;
        */
        List<Puntajes> listaJugadores = new List<Puntajes>();
    
        using (SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Puntajes ORDER BY Puntaje DESC";
            listaJugadores = PreguntadoORT.Query<Puntajes>(sql).ToList();
        }
        return listaJugadores;
    }


}