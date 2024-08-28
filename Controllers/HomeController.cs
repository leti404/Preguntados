using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_Preguntados.Models;

namespace TP_Preguntados.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.categoria = Juego.ObtenerCategorias();
        ViewBag.dificultad = Juego.ObtenerDificultades();
        return View();
    }
    [HttpGet] 
    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.username = username;
        Juego.CargarPartida(username, dificultad, categoria);
        return RedirectToAction("ActionResult Jugar");
    }
    public IActionResult Jugar()// martu chekealo lo hice yo(leti) da error por algo del viewbag
    {
        ViewBag.PreguntaActual = Juego.ObtenerProximaPregunta();
        if(ViewBag.PreguntaActual.Count == 0)
        {
            return View("Fin");
        }
        else 
        {
            ViewBag.RespuestaActual = Juego.ObtenerProximasRespuestas(ViewBag.PreguntaActual.IdPregunta);
            return View();
        }
    }
    [HttpPost] IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        if(Juego.VerificarRespuesta(idPregunta, idRespuesta))
        {
            ViewBag.FueCorrecta = true;
        } 
        return View("Respuesta");
        
    }


}
