namespace WaveApi.Models
{
    public class Movie
    {
        public int movie_id { get; set; }
        public int content_id { get; set; }
        public string director { get; set; }
        public string classification { get; set; }
        public int duration { get; set; }

        public Content Content { get; set; }
    }
}
