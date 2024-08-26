public class Juego{
//Atributos
public static string username {get; set;}
private static int puntajeActual {get; set;}
private static int cantidadPreguntasCorrectas {get; set;}
private static List<Preguntas> preguntas {get; set;}
private static List<Respuestas> respuestas {get; set;}

const int RESP_CORRECTA = 100;
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
    preguntas = BD.ObtenerPreguntas(dificultad, categoria);
    respuestas = BD.ObtenerRespuestas(preguntas);
}
public static Preguntas ObtenerProximaPregunta(){
    Random random = new Random();
    int numeroAleatorio = random.Next(0, 19);
    return preguntas[numeroAleatorio];
}
public static List<Respuestas> ObtenerProximasRespuestas(int idPregunta){
    List<Respuestas> RespuestasPorPreg = new List<Respuestas>();
    RespuestasPorPreg() = respuestas[idPregunta].IdPregunta = idPregunta;
    return RespuestasPorPreg;
}
public static bool VerificarRespuesta(int idPregunta, int idRespuesta){
    bool EsCorrecta = false;
    if(respuestas[idRespuesta].Correcta == true)
    {
        EsCorrecta = true;
        puntajeActual += RESP_CORRECTA;
        cantidadPreguntasCorrectas++;
    }
    else{
        EsCorrecta = false;
        preguntas.RemoveAt(idPregunta);
    }
    return EsCorrecta;
}
}

