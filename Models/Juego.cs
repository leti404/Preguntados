public class Juego{
//Atributos
public static string Username {get; set;}
public static int puntajeActual {get; set;}
private static int cantidadPreguntasCorrectas {get; set;}
private static List<Preguntas> preguntas {get; set;}
private static List<Respuestas> respuestas {get; set;}

const int RESP_CORRECTA = 100;
//Metodos
public static void InicializarJuego(){
    Username = string.Empty;
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
    Username = username;
}
public static Preguntas ObtenerProximaPregunta(){
    
    if(preguntas.Count == 0)
    {
        return  null;
    }
    else{
        Random random = new Random();
        int numeroAleatorio = random.Next(0, preguntas.Count);
        return preguntas[numeroAleatorio];
    }

}
public static List<Respuestas> ObtenerProximasRespuestas(int idPregunta){
    List<Respuestas> RespuestasPorPreg = new List<Respuestas>();
        foreach (Respuestas r in respuestas) {
        if (r.IdPregunta == idPregunta) {
            RespuestasPorPreg.Add(r);
        }
    }
    return RespuestasPorPreg;
}

public static bool VerificarRespuesta(int idPregunta, int idRespuesta){
    bool respuesta = respuestas.Find(r => r.IdRespuesta == idRespuesta).Correcta;
    if(respuesta)
    {
        puntajeActual += 10;
        cantidadPreguntasCorrectas++;
    }
    preguntas.Remove(preguntas.Find(preg => preg.IdPregunta == idPregunta));
    return respuesta;
}
}

