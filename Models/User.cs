using WaveApi.Models;

public class User
{
    public int user_id { get; set; }
    public string username { get; set; }
    public string image { get; set; }
    public string email { get; set; }
    public string password { get; set; }
    public DateTime? birth { get; set; }
}
