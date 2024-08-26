public class Juego{
//Atributos
private static string username {get; set;}
private static int puntajeActual {get; set;}
private static int cantidadPreguntasCorrectas {get; set;}
private static List<Preguntas> preguntas {get; set;}
private static List<Respuestas> preguntas1 {get; set;}


//Metodos
public static void InicializarJuego(){
    username = string.Empty;
    puntajeActual = 0;
    cantidadPreguntasCorrectas = 0;
}

public static List<Categorias> ObtenerCategorias(){
    List<Categorias> ListaCategorias = new List<Categorias>();
    return ListaCategorias;
}
public static List<Dificultades> ObtenerDificultades(){
    List<Dificultades> ListaDificultad = new List<Dificultades>();
    return ListaDificultad;
}
public static void CargarPartida(string username, int dificultad, int categoria){
    BD.ObtenerPreguntas()
}
public static void ObtenerProximaPregunta(){
    
}
public static void ObtenerProximasRespuestas(int idPregunta){
    
}
public static void VerificarRespuesta(int idPregunta, int idRespuesta){
    
}
}

