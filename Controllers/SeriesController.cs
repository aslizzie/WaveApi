using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using WaveApi.Models;

namespace WaveApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SeriesController : ControllerBase
    {
        private readonly WaveContext _context;

        public SeriesController(WaveContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetSeries()
        {
            var series = await _context.Contents
                .Include(c => c.Serie)
                .Where(c => c.Serie != null)
                .Select(c => new
                {
                    ContentId = c.content_id,
                    Title = c.title,
                    Banner = c.banner_image,
                    SerieId = c.Serie.serie_id,
                })
                .ToListAsync();

            return Ok(series);
        }

        [HttpGet("{contentId}")]
        public async Task<IActionResult> GetSeriesById(int contentId)
        {
            var serie = await _context.Contents
                .Include(c => c.Serie)
                .Where(c => c.content_id == contentId && c.Serie != null)
                .Select(c => new
                {
                    ContentId = c.content_id,
                    Title = c.title,
                    Description = c.description,
                    Hero = c.hero_image,
                    Genre = c.genre,
                    SerieId = c.Serie.serie_id,
                })
                .FirstOrDefaultAsync();

            if (serie == null)
            {
                return NotFound();
            }

            return Ok(serie);
        }
    }
}