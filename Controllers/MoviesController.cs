using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using System.Linq;
using WaveApi.Models;

namespace WaveApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MoviesController : ControllerBase
    {
        private readonly WaveContext _context; // Usa el nombre correcto aquí

        public MoviesController(WaveContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetMovies()
        {
            var movies = await _context.Contents
                .Include(c => c.Movie)
                .Where(c => c.Movie != null)
                .Select(c => new
                {
                    ContentId = c.content_id,
                    Title = c.title,
                    Banner = c.banner_image,
                    MovieId = c.Movie.movie_id,
                })
                .ToListAsync();

            return Ok(movies);
        }

        [HttpGet("{contentId}")]
        public async Task<IActionResult> GetMoviesById(int contentId)
        {
            var movie = await _context.Contents
                .Include(c => c.Movie)
                .Where(c => c.content_id == contentId && c.Movie != null)
                .Select(c => new
                {
                    ContentId = c.content_id,
                    Title = c.title,
                    Description = c.description,
                    Hero = c.hero_image,
                    Genre = c.genre,
                    Director = c.Movie.director,
                    MovieId = c.Movie.movie_id,
                })
                .FirstOrDefaultAsync();

            if (movie == null)
            {
                return NotFound();
            }

            return Ok(movie);
        }
    }
}
