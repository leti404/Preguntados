using System.Data.SqlClient;
using System;
using Dapper;
public class BD{
    private static string _connectionString = @"Server=localhost; DataBase=JJOO;Trusted_Connection=True;";
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
    public static void ObtenerPreguntas(int idDificultad, int idCategoria){        
        using(SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Preguntas WHERE  IdDificultad = @pidDificultad  AND  IdCategoria = @pidCategoria ";
            List<Preguntas> ListaPreguntas = PreguntadoORT.Query<Preguntas>(sql).ToList();
            PreguntadoORT.Execute(sql, new{IdDificultad = idDificultad, IdCategoria = idCategoria}); 
        }
    }
    public static List<Preguntas> ObtenerRespuestas(List<Preguntas>ListaPreguntas){        
        using(SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Respuestas WHERE  IdPregunta = @pidPregunta";
            List<Preguntas> ListaPreguntas = PreguntadoORT.Query<Preguntas>(sql).ToList();
            PreguntadoORT.Execute(sql, new{IdDificultad = idDificultad, IdCategoria = idCategoria}); 
        }
        return ListaRespuestas;
    }

}