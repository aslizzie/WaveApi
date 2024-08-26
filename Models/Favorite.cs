namespace WaveApi.Models
{
    public class Favorite
    {
        public int user_id { get; set; }
        public int content_id { get; set; }
        public Content? Content { get; set; }
    }
}
