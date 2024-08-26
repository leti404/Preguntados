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

    [HttpGet]
    public IActionResult Index()
    {
        return View();
    }

    [HttpPost] // cambiar     public static string nombJugador { get; set; } = "Jugador1"; tiene que ir a la bd.cs
    public IActionResult Comenzar(string username)
    {
        Escape.username = username;
        return RedirectToAction("Tutorial");
    }

    public IActionResult ConfigurarJuego()
    {
        ViewBag.categoria = Juego.InicializarJuego();
        ViewBag.
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
}
