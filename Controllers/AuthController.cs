using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using WaveApi.Models;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace WaveApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly WaveContext _context;

        public AuthController(WaveContext context)
        {
            _context = context;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginModel model)
        {
            var user = await _context.Users
                .FirstOrDefaultAsync(u => u.username == model.Username && u.password == model.Password);

            if (user == null || user.password == null)
                return Unauthorized();
            return Ok(new { data = user.username, userId = user.user_id });
        }
    }

    public class LoginModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
