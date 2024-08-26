using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using System.Linq;
using WaveApi.Models;

namespace WaveApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FavoritesController : ControllerBase
    {
        private readonly WaveContext _context;

        public FavoritesController(WaveContext context)
        {
            _context = context;
        }

        [HttpPost]
        public async Task<IActionResult> AddDeleteToFavorites([FromBody] Favorite model)
        {

            var existingFavorite = await _context.Favorites
        .FirstOrDefaultAsync(f => f.user_id == model.user_id && f.content_id == model.content_id);

            if (existingFavorite != null)
            {
                _context.Favorites.Remove(existingFavorite);
                await _context.SaveChangesAsync();
                return Ok(new { message = "Removed from favorites" });
            }
            else
            {
                var newFavorite = new Favorite { user_id = model.user_id, content_id = model.content_id };
                _context.Favorites.Add(newFavorite);
                await _context.SaveChangesAsync();
                return Ok(new { message = "Added to favorites" });
            }
        }

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetFavorites(int userId)
        {
            var favorites = _context.Favorites
        .Select(f => new
        {
            f.Content.content_id,
            f.Content.title,
            f.Content.banner_image
        }
        )
        .ToList();

            if (favorites == null || !favorites.Any())
            {
                return NotFound("No favorites found for this user.");
            }

            return Ok(favorites);
        }

        [HttpGet("isFavorite/{userId}/{contentId}")]
        public async Task<IActionResult> IsFavorite(int userId, int contentId)
        {
            var favorite = await _context.Favorites
                .FirstOrDefaultAsync(f => f.user_id == userId && f.content_id == contentId);

            return Ok(favorite != null);
        }
    }
}

