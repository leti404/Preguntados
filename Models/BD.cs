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
            foreach(Preguntas pregunta in ListaPreguntas){
            string sql = "SELECT * FROM Respuestas WHERE Idpregunta = @pPregunta";
            ListaRespuestas = PreguntadoORT.Query<Respuestas>(sql, new{pPregunta = pregunta.IdPregunta}).ToList();
            ListaRespuestas.AddRange(ListaRespuestas);
            }
        }
        return ListaRespuestas;
    }

}