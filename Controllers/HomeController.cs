using System;
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

    [HttpPost] 
    public IActionResult Comenzar(string username, int dificultad, int categoria, int puntajeActual)
    {

        ViewBag.NombreUser = username;
        ViewBag.puntajeActual = Juego.puntajeActual;
        Juego.CargarPartida(username, dificultad, categoria);
        return RedirectToAction("Jugar");
    }
    public IActionResult Jugar()
    {
        ViewBag.PreguntaActual = Juego.ObtenerProximaPregunta();
        ViewBag.puntajeActual = Juego.puntajeActual;
        if(ViewBag.PreguntaActual == null)
        {
            return View("Fin");
        }
        else
        {
            ViewBag.DatosRespuestas = Juego.ObtenerProximasRespuestas(ViewBag.PreguntaActual.IdPregunta);
            return View("Jugar");
        }
    }
    [HttpPost]
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        if(Juego.VerificarRespuesta(idPregunta, idRespuesta))
        {
            ViewBag.FueCorrecta = true;
        } 
        return View("Respuesta");
    }
    }

    [HttpPost]
    public IActionResult AgregarPuntaje(DateTime fecha)
    {
        BD.AgregarPuntaje(fecha);
        return RedirectToAction("MostrarPuntajes");
    }
    public IActionResult TablaPuntajes()
    {
        ViewBag.ListaJugadores = BD.ObtenerJugadores();
        return View();
    }
}

